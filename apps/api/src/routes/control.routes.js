const router = require('express').Router();
const { body, param, validationResult } = require('express-validator');
const { query, queryOne, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');

router.use(authenticate);

// GET /api/control?anio=2026&mes=1
// Retorna la grilla de control mensual con todos los días del mes
router.get('/', async (req, res) => {
  const anio = parseInt(req.query.anio) || new Date().getFullYear();
  const mes  = parseInt(req.query.mes)  || new Date().getMonth() + 1;

  const result = await query(
    `SELECT cm.*, v.patente, c.nombre AS nombre_conductor, c.rut
     FROM operacion.ControlMensual cm
     JOIN flota.Vehiculo v  ON v.id_vehiculo  = cm.id_vehiculo
     JOIN flota.Conductor c ON c.id_conductor = cm.id_conductor
     WHERE cm.anio = @anio AND cm.mes = @mes
     ORDER BY v.patente, cm.fecha`,
    [
      { name: 'anio', type: sql.SmallInt, value: anio },
      { name: 'mes',  type: sql.TinyInt,  value: mes },
    ]
  );

  // Feriados del mes para el frontend
  const feriados = await query(
    `SELECT fecha, descripcion FROM config.Feriado
     WHERE YEAR(fecha) = @anio AND MONTH(fecha) = @mes`,
    [
      { name: 'anio', type: sql.SmallInt, value: anio },
      { name: 'mes',  type: sql.TinyInt,  value: mes },
    ]
  );

  res.json({ anio, mes, registros: result.recordset, feriados: feriados.recordset });
});

// POST /api/control  — registra o actualiza un día de control
router.post('/',
  authorize('ADMIN', 'OPERADOR'),
  body('anio').isInt({ min: 2000, max: 2099 }),
  body('mes').isInt({ min: 1, max: 12 }),
  body('fecha').isISO8601(),
  body('id_vehiculo').isInt({ min: 1 }),
  body('id_conductor').isInt({ min: 1 }),
  body('estado_dia').isIn(['TRABAJO','DESCANSO','FERIADO','PERMISO','AUSENTE','SIN_SERVICIO']),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { anio, mes, fecha, id_vehiculo, id_conductor, estado_dia, id_hoja_ruta, observaciones } = req.body;

    await query(
      `MERGE operacion.ControlMensual AS target
       USING (VALUES (@anio, @mes, @fecha, @veh, @cond)) AS source(anio, mes, fecha, id_vehiculo, id_conductor)
       ON target.fecha = source.fecha AND target.id_vehiculo = source.id_vehiculo AND target.id_conductor = source.id_conductor
       WHEN MATCHED THEN
         UPDATE SET estado_dia = @estado, id_hoja_ruta = @hr, observaciones = @obs
       WHEN NOT MATCHED THEN
         INSERT (anio, mes, id_vehiculo, id_conductor, fecha, estado_dia, id_hoja_ruta, observaciones)
         VALUES (@anio, @mes, @veh, @cond, @fecha, @estado, @hr, @obs);`,
      [
        { name: 'anio',   type: sql.SmallInt,    value: anio },
        { name: 'mes',    type: sql.TinyInt,     value: mes },
        { name: 'fecha',  type: sql.Date,        value: fecha },
        { name: 'veh',    type: sql.Int,         value: id_vehiculo },
        { name: 'cond',   type: sql.Int,         value: id_conductor },
        { name: 'estado', type: sql.VarChar(20), value: estado_dia },
        { name: 'hr',     type: sql.Int,         value: id_hoja_ruta ?? null },
        { name: 'obs',    type: sql.VarChar(300),value: observaciones ?? null },
      ]
    );

    res.json({ ok: true });
  }
);

module.exports = router;
