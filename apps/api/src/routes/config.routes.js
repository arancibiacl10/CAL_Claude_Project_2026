const router = require('express').Router();
const { body, validationResult } = require('express-validator');
const { query, queryOne, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');

router.use(authenticate);

router.get('/parametros', async (_req, res) => {
  const result = await query(`SELECT * FROM config.Parametro ORDER BY clave`, []);
  res.json(result.recordset);
});

router.put('/parametros/:clave',
  authorize('ADMIN'),
  body('valor').notEmpty(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    await query(
      `UPDATE config.Parametro SET valor = @valor, ultima_modificacion = SYSDATETIME() WHERE clave = @clave`,
      [
        { name: 'valor', type: sql.VarChar(500), value: req.body.valor },
        { name: 'clave', type: sql.VarChar(50),  value: req.params.clave },
      ]
    );
    res.json({ ok: true });
  }
);

router.get('/estados-vehiculo', async (_req, res) => {
  const result = await query(`SELECT * FROM config.EstadoVehiculo WHERE activo = 1 ORDER BY descripcion`, []);
  res.json(result.recordset);
});

router.get('/tipos-licencia', async (_req, res) => {
  const result = await query(`SELECT * FROM config.TipoLicencia ORDER BY codigo`, []);
  res.json(result.recordset);
});

router.get('/feriados', async (req, res) => {
  const anio = parseInt(req.query.anio) || new Date().getFullYear();
  const result = await query(
    `SELECT * FROM config.Feriado WHERE YEAR(fecha) = @anio ORDER BY fecha`,
    [{ name: 'anio', type: sql.SmallInt, value: anio }]
  );
  res.json(result.recordset);
});

router.post('/feriados',
  authorize('ADMIN'),
  body('fecha').isISO8601(),
  body('descripcion').notEmpty().trim(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { fecha, descripcion, irrenunciable } = req.body;
    await query(
      `INSERT INTO config.Feriado (fecha, descripcion, irrenunciable) VALUES (@f, @d, @i)`,
      [
        { name: 'f', type: sql.Date,       value: fecha },
        { name: 'd', type: sql.VarChar(150), value: descripcion },
        { name: 'i', type: sql.Bit,        value: irrenunciable ? 1 : 0 },
      ]
    );
    res.status(201).json({ ok: true });
  }
);

module.exports = router;
