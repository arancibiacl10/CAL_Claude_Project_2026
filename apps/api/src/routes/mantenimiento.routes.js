const router = require('express').Router();
const { body, param, query: qv, validationResult } = require('express-validator');
const { query, queryOne, paginate, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');

const ESTADO_EN_TALLER  = 2;
const ESTADO_AUTORIZADO = 1;

router.use(authenticate);

// GET /api/mantenimientos?id_vehiculo=&page=&pageSize=
router.get('/', async (req, res) => {
  const { page, pageSize, offset } = paginate(req.query.page, req.query.pageSize);
  const idVehiculo = req.query.id_vehiculo ? parseInt(req.query.id_vehiculo) : null;

  const result = await query(
    `SELECT m.*, v.patente
     FROM flota.MantenimientoVehiculo m
     JOIN flota.Vehiculo v ON v.id_vehiculo = m.id_vehiculo
     ${idVehiculo ? 'WHERE m.id_vehiculo = @idVehiculo' : ''}
     ORDER BY m.fecha_inicio DESC
     OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY`,
    [
      { name: 'offset',     type: sql.Int, value: offset },
      { name: 'pageSize',   type: sql.Int, value: pageSize },
      ...(idVehiculo ? [{ name: 'idVehiculo', type: sql.Int, value: idVehiculo }] : []),
    ]
  );

  const total = await queryOne(
    `SELECT COUNT(*) AS total FROM flota.MantenimientoVehiculo ${idVehiculo ? 'WHERE id_vehiculo = @idVehiculo' : ''}`,
    idVehiculo ? [{ name: 'idVehiculo', type: sql.Int, value: idVehiculo }] : []
  );

  res.json({ data: result.recordset, page, pageSize, total: total.total });
});

// GET /api/mantenimientos/proximos?dias=30
router.get('/proximos', async (req, res) => {
  const dias = parseInt(req.query.dias) || 30;
  const result = await query(
    `SELECT m.id_mantenimiento, v.patente, m.fecha_proximo,
            DATEDIFF(DAY, CAST(GETDATE() AS DATE), m.fecha_proximo) AS dias_restantes
     FROM flota.MantenimientoVehiculo m
     JOIN flota.Vehiculo v ON v.id_vehiculo = m.id_vehiculo
     WHERE m.fecha_proximo IS NOT NULL
       AND m.estado = 'FINALIZADO'
       AND m.fecha_proximo <= DATEADD(DAY, @dias, CAST(GETDATE() AS DATE))
     ORDER BY m.fecha_proximo ASC`,
    [{ name: 'dias', type: sql.Int, value: dias }]
  );
  res.json(result.recordset);
});

// GET /api/mantenimientos/:id
router.get('/:id', param('id').isInt(), async (req, res) => {
  const mantenimiento = await queryOne(
    `SELECT m.*, v.patente
     FROM flota.MantenimientoVehiculo m
     JOIN flota.Vehiculo v ON v.id_vehiculo = m.id_vehiculo
     WHERE m.id_mantenimiento = @id`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );
  if (!mantenimiento) return res.status(404).json({ error: 'Mantenimiento no encontrado' });
  res.json(mantenimiento);
});

// POST /api/mantenimientos  (abre un mantenimiento -> vehículo pasa a EN_TALLER)
router.post('/',
  authorize('ADMIN', 'OPERADOR'),
  body('id_vehiculo').isInt({ min: 1 }),
  body('tipo_mantenimiento').isIn(['PREVENTIVO', 'CORRECTIVO']),
  body('fecha_inicio').isISO8601(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { id_vehiculo, tipo_mantenimiento, fecha_inicio, km_actual, taller, descripcion, observaciones } = req.body;

    const vehiculo = await queryOne(
      `SELECT id_estado FROM flota.Vehiculo WHERE id_vehiculo = @id`,
      [{ name: 'id', type: sql.Int, value: id_vehiculo }]
    );
    if (!vehiculo) return res.status(404).json({ error: 'Vehículo no encontrado' });

    const enCurso = await queryOne(
      `SELECT id_mantenimiento FROM flota.MantenimientoVehiculo WHERE id_vehiculo = @id AND estado = 'EN_CURSO'`,
      [{ name: 'id', type: sql.Int, value: id_vehiculo }]
    );
    if (enCurso) return res.status(409).json({ error: 'El vehículo ya tiene un mantenimiento en curso' });

    const result = await query(
      `INSERT INTO flota.MantenimientoVehiculo
         (id_vehiculo, tipo_mantenimiento, fecha_inicio, km_actual, taller, descripcion, observaciones, id_usuario_reg)
       OUTPUT INSERTED.id_mantenimiento
       VALUES (@vid, @tipo, @fecha, @km, @taller, @desc, @obs, @usr)`,
      [
        { name: 'vid',   type: sql.Int,          value: id_vehiculo },
        { name: 'tipo',  type: sql.VarChar(20),  value: tipo_mantenimiento },
        { name: 'fecha', type: sql.Date,         value: fecha_inicio },
        { name: 'km',    type: sql.Decimal(10,1),value: km_actual ?? null },
        { name: 'taller',type: sql.VarChar(150), value: taller ?? null },
        { name: 'desc',  type: sql.VarChar(500), value: descripcion ?? null },
        { name: 'obs',   type: sql.VarChar(500), value: observaciones ?? null },
        { name: 'usr',   type: sql.Int,          value: req.user.id },
      ]
    );

    await query(
      `UPDATE flota.Vehiculo SET id_estado = @estado WHERE id_vehiculo = @id`,
      [
        { name: 'estado', type: sql.TinyInt, value: ESTADO_EN_TALLER },
        { name: 'id',     type: sql.Int,     value: id_vehiculo },
      ]
    );

    await query(
      `INSERT INTO flota.HistorialEstadoVehiculo
         (id_vehiculo, id_estado_anterior, id_estado_nuevo, motivo, id_usuario)
       VALUES (@vid, @ant, @nuevo, @motivo, @usr)`,
      [
        { name: 'vid',    type: sql.Int,          value: id_vehiculo },
        { name: 'ant',    type: sql.TinyInt,      value: vehiculo.id_estado },
        { name: 'nuevo',  type: sql.TinyInt,      value: ESTADO_EN_TALLER },
        { name: 'motivo', type: sql.VarChar(500), value: `Ingreso a mantenimiento (${tipo_mantenimiento})` },
        { name: 'usr',    type: sql.Int,          value: req.user.id },
      ]
    );

    res.status(201).json({ id_mantenimiento: result.recordset[0].id_mantenimiento });
  }
);

// PUT /api/mantenimientos/:id  (edición de datos, sin cambio de estado)
router.put('/:id',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  body('km_actual').optional().isFloat({ min: 0 }),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { km_actual, taller, costo, descripcion, observaciones } = req.body;
    const id = parseInt(req.params.id);

    const actual = await queryOne(
      `SELECT id_mantenimiento FROM flota.MantenimientoVehiculo WHERE id_mantenimiento = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!actual) return res.status(404).json({ error: 'Mantenimiento no encontrado' });

    await query(
      `UPDATE flota.MantenimientoVehiculo SET
         km_actual     = ISNULL(@km, km_actual),
         taller        = ISNULL(@taller, taller),
         costo         = ISNULL(@costo, costo),
         descripcion   = ISNULL(@desc, descripcion),
         observaciones = ISNULL(@obs, observaciones)
       WHERE id_mantenimiento = @id`,
      [
        { name: 'km',    type: sql.Decimal(10,1), value: km_actual ?? null },
        { name: 'taller',type: sql.VarChar(150),  value: taller ?? null },
        { name: 'costo', type: sql.Decimal(12,2), value: costo ?? null },
        { name: 'desc',  type: sql.VarChar(500),  value: descripcion ?? null },
        { name: 'obs',   type: sql.VarChar(500),  value: observaciones ?? null },
        { name: 'id',    type: sql.Int,           value: id },
      ]
    );

    res.json({ ok: true });
  }
);

// PUT /api/mantenimientos/:id/finalizar  (cierra el mantenimiento -> vehículo vuelve a AUTORIZADO)
router.put('/:id/finalizar',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  body('fecha_fin').isISO8601(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { fecha_fin, fecha_proximo, costo } = req.body;
    const id = parseInt(req.params.id);

    const mantenimiento = await queryOne(
      `SELECT id_vehiculo, estado FROM flota.MantenimientoVehiculo WHERE id_mantenimiento = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!mantenimiento) return res.status(404).json({ error: 'Mantenimiento no encontrado' });
    if (mantenimiento.estado === 'FINALIZADO') return res.status(409).json({ error: 'El mantenimiento ya está finalizado' });

    await query(
      `UPDATE flota.MantenimientoVehiculo SET
         estado        = 'FINALIZADO',
         fecha_fin     = @fechaFin,
         fecha_proximo = @fechaProximo,
         costo         = ISNULL(@costo, costo)
       WHERE id_mantenimiento = @id`,
      [
        { name: 'fechaFin',     type: sql.Date,         value: fecha_fin },
        { name: 'fechaProximo',type: sql.Date,          value: fecha_proximo ?? null },
        { name: 'costo',        type: sql.Decimal(12,2),value: costo ?? null },
        { name: 'id',           type: sql.Int,          value: id },
      ]
    );

    await query(
      `UPDATE flota.Vehiculo SET id_estado = @estado WHERE id_vehiculo = @id`,
      [
        { name: 'estado', type: sql.TinyInt, value: ESTADO_AUTORIZADO },
        { name: 'id',     type: sql.Int,     value: mantenimiento.id_vehiculo },
      ]
    );

    await query(
      `INSERT INTO flota.HistorialEstadoVehiculo
         (id_vehiculo, id_estado_anterior, id_estado_nuevo, motivo, id_usuario)
       VALUES (@vid, @ant, @nuevo, @motivo, @usr)`,
      [
        { name: 'vid',    type: sql.Int,          value: mantenimiento.id_vehiculo },
        { name: 'ant',    type: sql.TinyInt,      value: ESTADO_EN_TALLER },
        { name: 'nuevo',  type: sql.TinyInt,      value: ESTADO_AUTORIZADO },
        { name: 'motivo', type: sql.VarChar(500), value: 'Fin de mantenimiento' },
        { name: 'usr',    type: sql.Int,          value: req.user.id },
      ]
    );

    res.json({ ok: true });
  }
);

module.exports = router;
