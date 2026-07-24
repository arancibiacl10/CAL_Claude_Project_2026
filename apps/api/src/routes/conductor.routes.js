const router = require('express').Router();
const { body, param, validationResult } = require('express-validator');
const { query, queryOne, paginate, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');

router.use(authenticate);

// GET /api/conductores
router.get('/', async (req, res) => {
  const { page, pageSize, offset } = paginate(req.query.page, req.query.pageSize);
  const soloActivos = req.query.activos !== 'false';
  const busqueda    = req.query.q?.trim() ?? '';

  const result = await query(
    `SELECT c.id_conductor, c.rut, c.nombre, c.apellido_paterno, c.apellido_materno,
            c.telefono, c.email, c.activo, c.fecha_ingreso,
            (SELECT TOP 1 FORMAT(fecha_vencimiento,'dd/MM/yyyy')
             FROM flota.LicenciaConductor
             WHERE id_conductor = c.id_conductor AND activa = 1
             ORDER BY fecha_vencimiento ASC) AS vencimiento_licencia
     FROM flota.Conductor c
     WHERE (@busqueda = '' OR c.nombre LIKE '%' + @busqueda + '%'
            OR c.rut LIKE '%' + @busqueda + '%')
       ${soloActivos ? 'AND c.activo = 1' : ''}
     ORDER BY c.nombre
     OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY`,
    [
      { name: 'busqueda', type: sql.VarChar(100), value: busqueda },
      { name: 'offset',   type: sql.Int,          value: offset },
      { name: 'pageSize', type: sql.Int,          value: pageSize },
    ]
  );

  const total = await queryOne(
    `SELECT COUNT(*) AS total FROM flota.Conductor
     WHERE (@busqueda = '' OR nombre LIKE '%' + @busqueda + '%' OR rut LIKE '%' + @busqueda + '%')
     ${soloActivos ? 'AND activo = 1' : ''}`,
    [{ name: 'busqueda', type: sql.VarChar(100), value: busqueda }]
  );

  res.json({ data: result.recordset, page, pageSize, total: total.total });
});

// GET /api/conductores/:id
router.get('/:id', param('id').isInt(), async (req, res) => {
  const conductor = await queryOne(
    `SELECT * FROM flota.Conductor WHERE id_conductor = @id`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );
  if (!conductor) return res.status(404).json({ error: 'Conductor no encontrado' });

  const licencias = await query(
    `SELECT l.*, t.codigo AS tipo_codigo, t.descripcion AS tipo_desc
     FROM flota.LicenciaConductor l
     JOIN config.TipoLicencia t ON t.id_tipo_licencia = l.id_tipo_licencia
     WHERE l.id_conductor = @id ORDER BY l.fecha_vencimiento DESC`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  const vehiculosAsignados = await query(
    `SELECT a.*, v.patente
     FROM flota.AsignacionVehiculoConductor a
     JOIN flota.Vehiculo v ON v.id_vehiculo = a.id_vehiculo
     WHERE a.id_conductor = @id ORDER BY a.fecha_desde DESC`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  res.json({ ...conductor, licencias: licencias.recordset, vehiculos: vehiculosAsignados.recordset });
});

// POST /api/conductores
router.post('/',
  authorize('ADMIN', 'OPERADOR'),
  body('rut').notEmpty().trim(),
  body('nombre').notEmpty().trim(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { rut, nombre, apellido_paterno, apellido_materno, direccion, telefono, email, fecha_ingreso } = req.body;

    const result = await query(
      `INSERT INTO flota.Conductor
         (rut, nombre, apellido_paterno, apellido_materno, direccion, telefono, email, fecha_ingreso, id_usuario_reg)
       OUTPUT INSERTED.id_conductor
       VALUES (@rut, @nombre, @ap, @am, @dir, @tel, @email, @fi, @usr)`,
      [
        { name: 'rut',    type: sql.VarChar(12),  value: rut },
        { name: 'nombre', type: sql.VarChar(150), value: nombre },
        { name: 'ap',     type: sql.VarChar(100), value: apellido_paterno ?? null },
        { name: 'am',     type: sql.VarChar(100), value: apellido_materno ?? null },
        { name: 'dir',    type: sql.VarChar(300), value: direccion ?? null },
        { name: 'tel',    type: sql.VarChar(20),  value: telefono ?? null },
        { name: 'email',  type: sql.VarChar(150), value: email ?? null },
        { name: 'fi',     type: sql.Date,         value: fecha_ingreso ?? null },
        { name: 'usr',    type: sql.Int,          value: req.user.id },
      ]
    );

    res.status(201).json({ id_conductor: result.recordset[0].id_conductor });
  }
);

// PUT /api/conductores/:id
router.put('/:id',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { nombre, apellido_paterno, apellido_materno, direccion, telefono, email, fecha_retiro, obs_retiro } = req.body;
    const id = parseInt(req.params.id);

    const existe = await queryOne(
      `SELECT id_conductor FROM flota.Conductor WHERE id_conductor = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!existe) return res.status(404).json({ error: 'Conductor no encontrado' });

    await query(
      `UPDATE flota.Conductor SET
         nombre           = ISNULL(@nombre, nombre),
         apellido_paterno = ISNULL(@ap, apellido_paterno),
         apellido_materno = ISNULL(@am, apellido_materno),
         direccion        = ISNULL(@dir, direccion),
         telefono         = ISNULL(@tel, telefono),
         email            = ISNULL(@email, email),
         fecha_retiro     = ISNULL(@fr, fecha_retiro),
         obs_retiro       = ISNULL(@obs, obs_retiro)
       WHERE id_conductor = @id`,
      [
        { name: 'nombre', type: sql.VarChar(150), value: nombre ?? null },
        { name: 'ap',     type: sql.VarChar(100), value: apellido_paterno ?? null },
        { name: 'am',     type: sql.VarChar(100), value: apellido_materno ?? null },
        { name: 'dir',    type: sql.VarChar(300), value: direccion ?? null },
        { name: 'tel',    type: sql.VarChar(20),  value: telefono ?? null },
        { name: 'email',  type: sql.VarChar(150), value: email ?? null },
        { name: 'fr',     type: sql.Date,         value: fecha_retiro ?? null },
        { name: 'obs',    type: sql.VarChar(500), value: obs_retiro ?? null },
        { name: 'id',     type: sql.Int,          value: id },
      ]
    );

    res.json({ ok: true });
  }
);

// GET /api/conductores/vencimientos/licencias
router.get('/vencimientos/licencias', async (req, res) => {
  const dias = parseInt(req.query.dias) || 30;
  const result = await query(
    `SELECT c.rut, c.nombre, l.id_tipo_licencia,
            t.codigo AS tipo_licencia, l.fecha_vencimiento,
            DATEDIFF(DAY, CAST(GETDATE() AS DATE), l.fecha_vencimiento) AS dias_restantes
     FROM flota.LicenciaConductor l
     JOIN flota.Conductor c ON c.id_conductor = l.id_conductor
     JOIN config.TipoLicencia t ON t.id_tipo_licencia = l.id_tipo_licencia
     WHERE l.activa = 1
       AND c.activo = 1
       AND l.fecha_vencimiento <= DATEADD(DAY, @dias, CAST(GETDATE() AS DATE))
     ORDER BY l.fecha_vencimiento ASC`,
    [{ name: 'dias', type: sql.Int, value: dias }]
  );
  res.json(result.recordset);
});

module.exports = router;
