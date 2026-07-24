const router = require('express').Router();
const { body, param, validationResult } = require('express-validator');
const { query, queryOne, paginate, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');

router.use(authenticate);

// GET /api/hoja-ruta?fecha=YYYY-MM-DD
router.get('/', async (req, res) => {
  const { page, pageSize, offset } = paginate(req.query.page, req.query.pageSize);
  const fecha    = req.query.fecha ?? null;
  const idVehiculo = req.query.id_vehiculo ?? null;

  const result = await query(
    `SELECT h.*, v.patente, c.nombre AS nombre_conductor, c.rut
     FROM operacion.HojaRuta h
     JOIN flota.Vehiculo v  ON v.id_vehiculo  = h.id_vehiculo
     JOIN flota.Conductor c ON c.id_conductor = h.id_conductor
     WHERE (@fecha IS NULL OR h.fecha = @fecha)
       AND (@veh IS NULL OR h.id_vehiculo = @veh)
     ORDER BY h.fecha DESC, v.patente
     OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY`,
    [
      { name: 'fecha',  type: sql.Date, value: fecha },
      { name: 'veh',    type: sql.Int,  value: idVehiculo ? parseInt(idVehiculo) : null },
      { name: 'offset', type: sql.Int,  value: offset },
      { name: 'pageSize', type: sql.Int, value: pageSize },
    ]
  );
  res.json({ data: result.recordset, page, pageSize });
});

// GET /api/hoja-ruta/:id
router.get('/:id', param('id').isInt(), async (req, res) => {
  const hoja = await queryOne(
    `SELECT h.*, v.patente, c.nombre AS nombre_conductor, c.rut
     FROM operacion.HojaRuta h
     JOIN flota.Vehiculo v  ON v.id_vehiculo  = h.id_vehiculo
     JOIN flota.Conductor c ON c.id_conductor = h.id_conductor
     WHERE h.id_hoja_ruta = @id`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );
  if (!hoja) return res.status(404).json({ error: 'Hoja de ruta no encontrada' });

  const detalles = await query(
    `SELECT * FROM operacion.DetalleHojaRuta WHERE id_hoja_ruta = @id ORDER BY orden`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  res.json({ ...hoja, detalles: detalles.recordset });
});

// POST /api/hoja-ruta
router.post('/',
  authorize('ADMIN', 'OPERADOR'),
  body('fecha').isISO8601(),
  body('id_vehiculo').isInt({ min: 1 }),
  body('id_conductor').isInt({ min: 1 }),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { fecha, id_vehiculo, id_conductor, hora_salida, hora_llegada, km_salida, km_llegada, observaciones } = req.body;

    const result = await query(
      `INSERT INTO operacion.HojaRuta
         (fecha, id_vehiculo, id_conductor, hora_salida, hora_llegada, km_salida, km_llegada, observaciones, id_usuario_reg)
       OUTPUT INSERTED.id_hoja_ruta
       VALUES (@fecha, @veh, @cond, @hs, @hl, @kms, @kml, @obs, @usr)`,
      [
        { name: 'fecha', type: sql.Date,          value: fecha },
        { name: 'veh',   type: sql.Int,           value: id_vehiculo },
        { name: 'cond',  type: sql.Int,           value: id_conductor },
        { name: 'hs',    type: sql.VarChar(8),    value: hora_salida  ?? null },
        { name: 'hl',    type: sql.VarChar(8),    value: hora_llegada ?? null },
        { name: 'kms',   type: sql.Decimal(10,1), value: km_salida    ?? null },
        { name: 'kml',   type: sql.Decimal(10,1), value: km_llegada   ?? null },
        { name: 'obs',   type: sql.VarChar(500),  value: observaciones ?? null },
        { name: 'usr',   type: sql.Int,           value: req.user.id },
      ]
    );

    res.status(201).json({ id_hoja_ruta: result.recordset[0].id_hoja_ruta });
  }
);

// PATCH /api/hoja-ruta/:id/estado
router.patch('/:id/estado',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  body('estado').isIn(['PENDIENTE', 'COMPLETADA', 'ANULADA']),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    await query(
      `UPDATE operacion.HojaRuta SET estado = @estado WHERE id_hoja_ruta = @id`,
      [
        { name: 'estado', type: sql.VarChar(20), value: req.body.estado },
        { name: 'id',     type: sql.Int,         value: parseInt(req.params.id) },
      ]
    );
    res.json({ ok: true });
  }
);

module.exports = router;
