const router = require('express').Router();
const { query, queryOne, sql } = require('../db/queries');
const { authenticate } = require('../middleware/auth');

router.use(authenticate);

// GET /api/reportes/dashboard
// Datos para el panel principal
router.get('/dashboard', async (_req, res) => {
  const [flota, vencimientosV, vencimientosL, recaudMes, deudasPendientes] = await Promise.all([
    query(
      `SELECT e.codigo, e.descripcion, COUNT(*) AS cantidad
       FROM flota.Vehiculo v
       JOIN config.EstadoVehiculo e ON e.id_estado = v.id_estado
       WHERE v.activo = 1 GROUP BY e.codigo, e.descripcion`,
      []
    ),
    query(
      `SELECT COUNT(*) AS cantidad FROM flota.DocumentoVehiculo d
       JOIN flota.Vehiculo v ON v.id_vehiculo = d.id_vehiculo
       WHERE d.activo = 1 AND v.activo = 1
         AND d.fecha_vencimiento <= DATEADD(DAY, 30, CAST(GETDATE() AS DATE))`,
      []
    ),
    query(
      `SELECT COUNT(*) AS cantidad FROM flota.LicenciaConductor l
       JOIN flota.Conductor c ON c.id_conductor = l.id_conductor
       WHERE l.activa = 1 AND c.activo = 1
         AND l.fecha_vencimiento <= DATEADD(DAY, 30, CAST(GETDATE() AS DATE))`,
      []
    ),
    queryOne(
      `SELECT ISNULL(SUM(monto_neto),0) AS total
       FROM finanzas.Recaudacion
       WHERE YEAR(fecha) = YEAR(GETDATE()) AND MONTH(fecha) = MONTH(GETDATE())`,
      []
    ),
    queryOne(
      `SELECT ISNULL(SUM(saldo_pendiente),0) AS total
       FROM finanzas.PagoAtrasado WHERE estado = 'PENDIENTE'`,
      []
    ),
  ]);

  res.json({
    flota: flota.recordset,
    alertas: {
      vencimientos_vehiculos: vencimientosV.recordset[0]?.cantidad ?? 0,
      vencimientos_licencias: vencimientosL.recordset[0]?.cantidad ?? 0,
    },
    recaudacion_mes_actual: recaudMes?.total ?? 0,
    deudas_pendientes: deudasPendientes?.total ?? 0,
  });
});

// GET /api/reportes/recaudacion-mensual?anio=2026
router.get('/recaudacion-mensual', async (req, res) => {
  const anio = parseInt(req.query.anio) || new Date().getFullYear();

  const result = await query(
    `SELECT MONTH(fecha) AS mes, v.patente,
            SUM(monto_neto) AS total_neto, COUNT(*) AS dias_operados
     FROM finanzas.Recaudacion r
     JOIN flota.Vehiculo v ON v.id_vehiculo = r.id_vehiculo
     WHERE YEAR(r.fecha) = @anio
     GROUP BY MONTH(r.fecha), v.patente
     ORDER BY mes, v.patente`,
    [{ name: 'anio', type: sql.SmallInt, value: anio }]
  );

  res.json({ anio, data: result.recordset });
});

// GET /api/reportes/informe-diario?fecha=YYYY-MM-DD
router.get('/informe-diario', async (req, res) => {
  const fecha = req.query.fecha ?? new Date().toISOString().split('T')[0];

  const operacion = await query(
    `SELECT h.*, v.patente, c.nombre AS conductor, c.rut,
            r.monto_neto AS recaudacion
     FROM operacion.HojaRuta h
     JOIN flota.Vehiculo v   ON v.id_vehiculo  = h.id_vehiculo
     JOIN flota.Conductor c  ON c.id_conductor = h.id_conductor
     LEFT JOIN finanzas.Recaudacion r ON r.fecha = h.fecha AND r.id_vehiculo = h.id_vehiculo
     WHERE h.fecha = @fecha
     ORDER BY v.patente`,
    [{ name: 'fecha', type: sql.Date, value: fecha }]
  );

  const totales = await queryOne(
    `SELECT COUNT(*)         AS vehiculos_operados,
            SUM(r.monto_neto) AS total_recaudado
     FROM finanzas.Recaudacion r WHERE r.fecha = @fecha`,
    [{ name: 'fecha', type: sql.Date, value: fecha }]
  );

  res.json({ fecha, operacion: operacion.recordset, totales });
});

// GET /api/reportes/consulta-pago-mes?id_conductor=X&anio=2026&mes=1
router.get('/consulta-pago-mes', async (req, res) => {
  const { id_conductor, anio, mes } = req.query;
  if (!id_conductor) return res.status(400).json({ error: 'id_conductor requerido' });

  const conductor = await queryOne(
    `SELECT rut, nombre FROM flota.Conductor WHERE id_conductor = @id`,
    [{ name: 'id', type: sql.Int, value: parseInt(id_conductor) }]
  );

  const pagos = await query(
    `SELECT r.fecha, v.patente, r.monto_bruto, r.descuentos, r.monto_neto, r.tipo_pago
     FROM finanzas.Recaudacion r
     JOIN flota.Vehiculo v ON v.id_vehiculo = r.id_vehiculo
     WHERE r.id_conductor = @cond
       AND (@anio IS NULL OR YEAR(r.fecha) = @anio)
       AND (@mes IS NULL OR MONTH(r.fecha) = @mes)
     ORDER BY r.fecha`,
    [
      { name: 'cond', type: sql.Int,      value: parseInt(id_conductor) },
      { name: 'anio', type: sql.SmallInt, value: anio ? parseInt(anio) : null },
      { name: 'mes',  type: sql.TinyInt,  value: mes  ? parseInt(mes)  : null },
    ]
  );

  const resumen = await queryOne(
    `SELECT SUM(monto_neto) AS total, COUNT(*) AS dias
     FROM finanzas.Recaudacion
     WHERE id_conductor = @cond
       AND (@anio IS NULL OR YEAR(fecha) = @anio)
       AND (@mes IS NULL OR MONTH(fecha) = @mes)`,
    [
      { name: 'cond', type: sql.Int,      value: parseInt(id_conductor) },
      { name: 'anio', type: sql.SmallInt, value: anio ? parseInt(anio) : null },
      { name: 'mes',  type: sql.TinyInt,  value: mes  ? parseInt(mes)  : null },
    ]
  );

  res.json({ conductor, pagos: pagos.recordset, resumen });
});

module.exports = router;
