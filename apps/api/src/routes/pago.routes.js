const router = require('express').Router();
const { body, param, validationResult } = require('express-validator');
const { query, queryOne, paginate, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');

router.use(authenticate);

// ── Pagos adelantados ──────────────────────────────────────────────────────

router.get('/adelantados', async (req, res) => {
  const { page, pageSize, offset } = paginate(req.query.page, req.query.pageSize);
  const result = await query(
    `SELECT p.*, v.patente, c.nombre AS nombre_conductor
     FROM finanzas.PagoAdelantado p
     JOIN flota.Vehiculo v  ON v.id_vehiculo  = p.id_vehiculo
     JOIN flota.Conductor c ON c.id_conductor = p.id_conductor
     ORDER BY p.fecha_pago DESC
     OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY`,
    [
      { name: 'offset',   type: sql.Int, value: offset },
      { name: 'pageSize', type: sql.Int, value: pageSize },
    ]
  );
  res.json({ data: result.recordset, page, pageSize });
});

router.post('/adelantados',
  authorize('ADMIN', 'OPERADOR'),
  body('id_conductor').isInt({ min: 1 }),
  body('id_vehiculo').isInt({ min: 1 }),
  body('fecha_pago').isISO8601(),
  body('fecha_periodo_desde').isISO8601(),
  body('fecha_periodo_hasta').isISO8601(),
  body('monto').isDecimal(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { id_conductor, id_vehiculo, fecha_pago, fecha_periodo_desde, fecha_periodo_hasta, monto, observaciones } = req.body;

    const result = await query(
      `INSERT INTO finanzas.PagoAdelantado
         (id_conductor, id_vehiculo, fecha_pago, fecha_periodo_desde, fecha_periodo_hasta, monto, observaciones, id_usuario_reg)
       OUTPUT INSERTED.id_pago
       VALUES (@cond, @veh, @fp, @fpd, @fph, @monto, @obs, @usr)`,
      [
        { name: 'cond',  type: sql.Int,           value: id_conductor },
        { name: 'veh',   type: sql.Int,           value: id_vehiculo },
        { name: 'fp',    type: sql.Date,          value: fecha_pago },
        { name: 'fpd',   type: sql.Date,          value: fecha_periodo_desde },
        { name: 'fph',   type: sql.Date,          value: fecha_periodo_hasta },
        { name: 'monto', type: sql.Decimal(12,2), value: parseFloat(monto) },
        { name: 'obs',   type: sql.VarChar(500),  value: observaciones ?? null },
        { name: 'usr',   type: sql.Int,           value: req.user.id },
      ]
    );

    res.status(201).json({ id_pago: result.recordset[0].id_pago });
  }
);

// ── Pagos atrasados / deudas ───────────────────────────────────────────────

router.get('/atrasados', async (req, res) => {
  const { page, pageSize, offset } = paginate(req.query.page, req.query.pageSize);
  const estado = req.query.estado ?? 'PENDIENTE';

  const result = await query(
    `SELECT p.*, v.patente, c.nombre AS nombre_conductor
     FROM finanzas.PagoAtrasado p
     JOIN flota.Vehiculo v  ON v.id_vehiculo  = p.id_vehiculo
     JOIN flota.Conductor c ON c.id_conductor = p.id_conductor
     WHERE (@estado = 'TODOS' OR p.estado = @estado)
     ORDER BY p.fecha_origen DESC
     OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY`,
    [
      { name: 'estado',   type: sql.VarChar(20), value: estado },
      { name: 'offset',   type: sql.Int,         value: offset },
      { name: 'pageSize', type: sql.Int,         value: pageSize },
    ]
  );
  res.json({ data: result.recordset, page, pageSize });
});

router.patch('/atrasados/:id/pagar',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  body('monto_pagado').isDecimal(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const id    = parseInt(req.params.id);
    const monto = parseFloat(req.body.monto_pagado);

    const deuda = await queryOne(
      `SELECT monto_deuda, monto_pagado FROM finanzas.PagoAtrasado WHERE id_deuda = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!deuda) return res.status(404).json({ error: 'Deuda no encontrada' });

    const nuevoMontoPagado = deuda.monto_pagado + monto;
    const nuevoEstado      = nuevoMontoPagado >= deuda.monto_deuda ? 'PAGADO' : 'PENDIENTE';

    await query(
      `UPDATE finanzas.PagoAtrasado
       SET monto_pagado = @mp, estado = @estado, fecha_pago = CASE WHEN @estado = 'PAGADO' THEN CAST(GETDATE() AS DATE) ELSE fecha_pago END
       WHERE id_deuda = @id`,
      [
        { name: 'mp',     type: sql.Decimal(12,2), value: nuevoMontoPagado },
        { name: 'estado', type: sql.VarChar(20),   value: nuevoEstado },
        { name: 'id',     type: sql.Int,           value: id },
      ]
    );

    res.json({ ok: true, estado: nuevoEstado, saldo_pendiente: deuda.monto_deuda - nuevoMontoPagado });
  }
);

module.exports = router;
