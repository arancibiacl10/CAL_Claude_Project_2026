const router = require('express').Router();
const { body, validationResult } = require('express-validator');
const { query, queryOne, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');

router.use(authenticate);

// GET /api/recaudacion?anio=2026&mes=1&id_vehiculo=X
router.get('/', async (req, res) => {
  const anio = parseInt(req.query.anio) || new Date().getFullYear();
  const mes  = parseInt(req.query.mes)  || new Date().getMonth() + 1;
  const idVehiculo = req.query.id_vehiculo ? parseInt(req.query.id_vehiculo) : null;

  const result = await query(
    `SELECT r.*, v.patente, c.nombre AS nombre_conductor
     FROM finanzas.Recaudacion r
     JOIN flota.Vehiculo v  ON v.id_vehiculo  = r.id_vehiculo
     JOIN flota.Conductor c ON c.id_conductor = r.id_conductor
     WHERE YEAR(r.fecha) = @anio
       AND MONTH(r.fecha) = @mes
       AND (@veh IS NULL OR r.id_vehiculo = @veh)
     ORDER BY r.fecha, v.patente`,
    [
      { name: 'anio', type: sql.SmallInt, value: anio },
      { name: 'mes',  type: sql.TinyInt,  value: mes },
      { name: 'veh',  type: sql.Int,      value: idVehiculo },
    ]
  );

  const resumen = await queryOne(
    `SELECT COUNT(*)         AS dias_operados,
            SUM(monto_bruto) AS total_bruto,
            SUM(descuentos)  AS total_descuentos,
            SUM(monto_neto)  AS total_neto
     FROM finanzas.Recaudacion
     WHERE YEAR(fecha) = @anio AND MONTH(fecha) = @mes
       AND (@veh IS NULL OR id_vehiculo = @veh)`,
    [
      { name: 'anio', type: sql.SmallInt, value: anio },
      { name: 'mes',  type: sql.TinyInt,  value: mes },
      { name: 'veh',  type: sql.Int,      value: idVehiculo },
    ]
  );

  res.json({ anio, mes, resumen, registros: result.recordset });
});

// POST /api/recaudacion
router.post('/',
  authorize('ADMIN', 'OPERADOR'),
  body('fecha').isISO8601(),
  body('id_vehiculo').isInt({ min: 1 }),
  body('id_conductor').isInt({ min: 1 }),
  body('monto_bruto').isDecimal(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { fecha, id_vehiculo, id_conductor, id_hoja_ruta, monto_bruto, descuentos, tipo_pago, observaciones } = req.body;

    await query(
      `MERGE finanzas.Recaudacion AS target
       USING (VALUES (@fecha, @veh)) AS source(fecha, id_vehiculo)
       ON target.fecha = source.fecha AND target.id_vehiculo = source.id_vehiculo
       WHEN MATCHED THEN
         UPDATE SET id_conductor = @cond, monto_bruto = @mb, descuentos = @desc,
                    tipo_pago = @tp, observaciones = @obs, id_usuario_reg = @usr
       WHEN NOT MATCHED THEN
         INSERT (fecha, id_vehiculo, id_conductor, id_hoja_ruta, monto_bruto, descuentos, tipo_pago, observaciones, id_usuario_reg)
         VALUES (@fecha, @veh, @cond, @hr, @mb, @desc, @tp, @obs, @usr);`,
      [
        { name: 'fecha', type: sql.Date,          value: fecha },
        { name: 'veh',   type: sql.Int,           value: id_vehiculo },
        { name: 'cond',  type: sql.Int,           value: id_conductor },
        { name: 'hr',    type: sql.Int,           value: id_hoja_ruta ?? null },
        { name: 'mb',    type: sql.Decimal(12,2), value: parseFloat(monto_bruto) },
        { name: 'desc',  type: sql.Decimal(12,2), value: parseFloat(descuentos ?? 0) },
        { name: 'tp',    type: sql.VarChar(20),   value: tipo_pago ?? 'NORMAL' },
        { name: 'obs',   type: sql.VarChar(500),  value: observaciones ?? null },
        { name: 'usr',   type: sql.Int,           value: req.user.id },
      ]
    );

    res.json({ ok: true });
  }
);

module.exports = router;
