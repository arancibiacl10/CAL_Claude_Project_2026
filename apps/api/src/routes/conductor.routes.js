const fs   = require('fs');
const path = require('path');
const router = require('express').Router();
const { body, param, validationResult } = require('express-validator');
const { query, queryOne, paginate, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');
const { getPool } = require('../db/connection');
const { validarRut, formatearRut } = require('../utils/rut');
const { uploadImagenConductor, CARPETA_IMAGENES_CONDUCTOR } = require('../middleware/uploadImagenConductor');

const CONTENT_TYPE_POR_EXTENSION = {
  '.jpg':  'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.png':  'image/png',
  '.webp': 'image/webp',
  '.gif':  'image/gif',
};

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

  const fotoConductor = await queryOne(
    `SELECT TOP 1 id_imagen, fecha_subida FROM flota.ImagenConductor
     WHERE id_conductor = @id AND tipo = 'FOTO_CONDUCTOR' ORDER BY fecha_subida DESC`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  const fotoLicencia = await queryOne(
    `SELECT TOP 1 id_imagen, fecha_subida FROM flota.ImagenConductor
     WHERE id_conductor = @id AND tipo = 'FOTO_LICENCIA' ORDER BY fecha_subida DESC`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  res.json({
    ...conductor,
    licencias: licencias.recordset,
    vehiculos: vehiculosAsignados.recordset,
    foto_conductor: fotoConductor ? { id_imagen: fotoConductor.id_imagen, fecha_subida: fotoConductor.fecha_subida } : null,
    foto_licencia: fotoLicencia ? { id_imagen: fotoLicencia.id_imagen, fecha_subida: fotoLicencia.fecha_subida } : null,
  });
});

// POST /api/conductores
router.post('/',
  authorize('ADMIN', 'OPERADOR'),
  body('rut').notEmpty().trim()
    .custom((value) => validarRut(value)).withMessage('RUT inválido'),
  body('nombre').notEmpty().trim(),
  body('apellido_paterno').optional().trim(),
  body('apellido_materno').optional().trim(),
  body('direccion').optional().trim(),
  body('telefono').optional().trim(),
  body('email').optional({ checkFalsy: true }).isEmail(),
  body('fecha_ingreso').optional().isISO8601(),
  body('observaciones').optional().trim(),
  body('id_tipo_licencia').optional().isInt({ min: 1 }),
  body('numero_licencia').optional().trim(),
  body('fecha_emision_licencia').optional().isISO8601(),
  body('fecha_vencimiento_licencia').optional().isISO8601(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const {
      rut, nombre, apellido_paterno, apellido_materno, direccion, telefono, email,
      fecha_ingreso, observaciones,
      id_tipo_licencia, numero_licencia, fecha_emision_licencia, fecha_vencimiento_licencia,
    } = req.body;

    const rutNormalizado = formatearRut(rut);

    const result = await query(
      `INSERT INTO flota.Conductor
         (rut, nombre, apellido_paterno, apellido_materno, direccion, telefono, email, fecha_ingreso, observaciones, id_usuario_reg)
       OUTPUT INSERTED.id_conductor
       VALUES (@rut, @nombre, @ap, @am, @dir, @tel, @email, @fi, @obs, @usr)`,
      [
        { name: 'rut',    type: sql.VarChar(12),  value: rutNormalizado },
        { name: 'nombre', type: sql.VarChar(150), value: nombre },
        { name: 'ap',     type: sql.VarChar(100), value: apellido_paterno || null },
        { name: 'am',     type: sql.VarChar(100), value: apellido_materno || null },
        { name: 'dir',    type: sql.VarChar(300), value: direccion || null },
        { name: 'tel',    type: sql.VarChar(20),  value: telefono || null },
        { name: 'email',  type: sql.VarChar(150), value: email || null },
        { name: 'fi',     type: sql.Date,         value: fecha_ingreso || null },
        { name: 'obs',    type: sql.VarChar(500), value: observaciones || null },
        { name: 'usr',    type: sql.Int,          value: req.user.id },
      ]
    );

    const id_conductor = result.recordset[0].id_conductor;

    if (fecha_vencimiento_licencia) {
      await query(
        `INSERT INTO flota.LicenciaConductor (id_conductor, id_tipo_licencia, numero_licencia, fecha_emision, fecha_vencimiento)
         VALUES (@id, @tipo, @num, @femision, @fvto)`,
        [
          { name: 'id',       type: sql.Int,          value: id_conductor },
          { name: 'tipo',     type: sql.TinyInt,      value: id_tipo_licencia || 1 },
          { name: 'num',      type: sql.VarChar(50),  value: numero_licencia || null },
          { name: 'femision', type: sql.Date,         value: fecha_emision_licencia || null },
          { name: 'fvto',     type: sql.Date,         value: fecha_vencimiento_licencia },
        ]
      );
    }

    res.status(201).json({ id_conductor });
  }
);

// PUT /api/conductores/:id
router.put('/:id',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  body('email').optional({ checkFalsy: true }).isEmail(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { nombre, apellido_paterno, apellido_materno, direccion, telefono, email, observaciones, fecha_retiro, obs_retiro } = req.body;
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
         observaciones    = ISNULL(@observaciones, observaciones),
         fecha_retiro     = ISNULL(@fr, fecha_retiro),
         obs_retiro       = ISNULL(@obs, obs_retiro)
       WHERE id_conductor = @id`,
      [
        { name: 'nombre',        type: sql.VarChar(150), value: nombre ?? null },
        { name: 'ap',            type: sql.VarChar(100), value: apellido_paterno ?? null },
        { name: 'am',            type: sql.VarChar(100), value: apellido_materno ?? null },
        { name: 'dir',           type: sql.VarChar(300), value: direccion ?? null },
        { name: 'tel',           type: sql.VarChar(20),  value: telefono ?? null },
        { name: 'email',         type: sql.VarChar(150), value: email ?? null },
        { name: 'observaciones', type: sql.VarChar(500), value: observaciones ?? null },
        { name: 'fr',            type: sql.Date,         value: fecha_retiro ?? null },
        { name: 'obs',           type: sql.VarChar(500), value: obs_retiro ?? null },
        { name: 'id',            type: sql.Int,          value: id },
      ]
    );

    res.json({ ok: true });
  }
);

// POST /api/conductores/:id/retirar
router.post('/:id/retirar',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  body('fecha_retiro').optional().isISO8601(),
  body('obs_retiro').optional().trim(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const id = parseInt(req.params.id);
    const { fecha_retiro, obs_retiro } = req.body;

    const existe = await queryOne(
      `SELECT id_conductor FROM flota.Conductor WHERE id_conductor = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!existe) return res.status(404).json({ error: 'Conductor no encontrado' });

    await query(
      `UPDATE flota.Conductor SET fecha_retiro = @fr, obs_retiro = @obs WHERE id_conductor = @id`,
      [
        { name: 'fr',  type: sql.Date,         value: fecha_retiro || new Date().toISOString().slice(0, 10) },
        { name: 'obs', type: sql.VarChar(500), value: obs_retiro || null },
        { name: 'id',  type: sql.Int,          value: id },
      ]
    );

    res.json({ ok: true });
  }
);

// POST /api/conductores/:id/reactivar
router.post('/:id/reactivar',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const id = parseInt(req.params.id);
    const existe = await queryOne(
      `SELECT id_conductor FROM flota.Conductor WHERE id_conductor = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!existe) return res.status(404).json({ error: 'Conductor no encontrado' });

    await query(
      `UPDATE flota.Conductor SET fecha_retiro = NULL, obs_retiro = NULL WHERE id_conductor = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );

    res.json({ ok: true });
  }
);

// DELETE /api/conductores/:id — eliminación permanente (irreversible)
router.delete('/:id',
  authorize('ADMIN'),
  param('id').isInt(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const id = parseInt(req.params.id);
    const existe = await queryOne(
      `SELECT id_conductor FROM flota.Conductor WHERE id_conductor = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!existe) return res.status(404).json({ error: 'Conductor no encontrado' });

    const imagenes = await query(
      `SELECT ruta_archivo FROM flota.ImagenConductor WHERE id_conductor = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );

    const tx = new sql.Transaction(getPool());
    try {
      await tx.begin();
      for (const tabla of ['flota.ImagenConductor', 'flota.LicenciaConductor', 'flota.AsignacionVehiculoConductor']) {
        const r = new sql.Request(tx);
        r.input('id', sql.Int, id);
        await r.query(`DELETE FROM ${tabla} WHERE id_conductor = @id`);
      }
      const rFinal = new sql.Request(tx);
      rFinal.input('id', sql.Int, id);
      await rFinal.query(`DELETE FROM flota.Conductor WHERE id_conductor = @id`);
      await tx.commit();
    } catch (err) {
      await tx.rollback();
      if (err.number === 547) {
        return res.status(409).json({ error: 'No se puede eliminar: tiene historial operativo asociado (hoja de ruta, control, recaudación o pagos). Use "Retirar" en su lugar.' });
      }
      throw err;
    }

    for (const img of imagenes.recordset) {
      const rutaAbsoluta = path.join(CARPETA_IMAGENES_CONDUCTOR, path.basename(img.ruta_archivo));
      if (fs.existsSync(rutaAbsoluta)) fs.unlinkSync(rutaAbsoluta);
    }

    res.json({ ok: true });
  }
);

// POST /api/conductores/:id/imagen — sube foto del conductor o de la licencia
router.post('/:id/imagen',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const id = parseInt(req.params.id);
    const conductor = await queryOne(
      `SELECT id_conductor FROM flota.Conductor WHERE id_conductor = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!conductor) return res.status(404).json({ error: 'Conductor no encontrado' });

    uploadImagenConductor.single('imagen')(req, res, async (err) => {
      if (err) return res.status(400).json({ error: err.message });
      if (!req.file) return res.status(400).json({ error: 'Debe adjuntar el archivo de la imagen' });
      if (!['FOTO_CONDUCTOR', 'FOTO_LICENCIA'].includes(req.body.tipo)) {
        return res.status(400).json({ error: 'Tipo de imagen inválido' });
      }

      const tipo = req.body.tipo;

      const nuevo = await query(
        `INSERT INTO flota.ImagenConductor (id_conductor, tipo, ruta_archivo)
         OUTPUT INSERTED.id_imagen, INSERTED.fecha_subida
         VALUES (@id, @tipo, @ruta)`,
        [
          { name: 'id',   type: sql.Int,          value: id },
          { name: 'tipo', type: sql.VarChar(50),  value: tipo },
          { name: 'ruta', type: sql.VarChar(500), value: req.file.filename },
        ]
      );

      res.status(201).json(nuevo.recordset[0]);
    });
  }
);

// GET /api/conductores/:id/imagen?tipo=FOTO_CONDUCTOR|FOTO_LICENCIA
router.get('/:id/imagen', param('id').isInt(), async (req, res) => {
  const tipo = req.query.tipo === 'FOTO_LICENCIA' ? 'FOTO_LICENCIA' : 'FOTO_CONDUCTOR';

  const imagen = await queryOne(
    `SELECT TOP 1 ruta_archivo FROM flota.ImagenConductor
     WHERE id_conductor = @id AND tipo = @tipo ORDER BY fecha_subida DESC`,
    [
      { name: 'id',   type: sql.Int,         value: req.params.id },
      { name: 'tipo', type: sql.VarChar(50), value: tipo },
    ]
  );
  if (!imagen) return res.status(404).json({ error: 'Este conductor no tiene esa imagen cargada' });

  const rutaAbsoluta = path.join(CARPETA_IMAGENES_CONDUCTOR, path.basename(imagen.ruta_archivo));
  if (!fs.existsSync(rutaAbsoluta)) return res.status(404).json({ error: 'El archivo de la imagen no se encuentra en el servidor' });

  const contentType = CONTENT_TYPE_POR_EXTENSION[path.extname(rutaAbsoluta).toLowerCase()] || 'application/octet-stream';
  res.setHeader('Content-Type', contentType);
  res.sendFile(rutaAbsoluta);
});

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
