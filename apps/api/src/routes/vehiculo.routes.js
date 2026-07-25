const fs   = require('fs');
const path = require('path');
const router = require('express').Router();
const { body, param, query: qv, validationResult } = require('express-validator');
const { query, queryOne, paginate, sql } = require('../db/queries');
const { authenticate, authorize } = require('../middleware/auth');
const { validarRut, formatearRut } = require('../utils/rut');
const { validarPatente, formatearPatente } = require('../utils/patente');
const { uploadContrato, CARPETA_CONTRATOS } = require('../middleware/uploadContrato');

router.use(authenticate);

// GET /api/vehiculos
router.get('/', async (req, res) => {
  const { page, pageSize, offset } = paginate(req.query.page, req.query.pageSize);
  const soloActivos = req.query.activos !== 'false';

  const result = await query(
    `SELECT v.id_vehiculo, v.patente, v.activo,
            e.codigo AS estado, e.descripcion AS estado_desc,
            v.fecha_ingreso, v.fecha_retiro,
            -- Documento más próximo a vencer
            (SELECT TOP 1 tipo_documento + ' ' + FORMAT(fecha_vencimiento,'dd/MM/yyyy')
             FROM flota.DocumentoVehiculo
             WHERE id_vehiculo = v.id_vehiculo AND activo = 1
             ORDER BY fecha_vencimiento ASC) AS proximo_vencimiento
     FROM flota.Vehiculo v
     JOIN config.EstadoVehiculo e ON e.id_estado = v.id_estado
     ${soloActivos ? 'WHERE v.activo = 1' : ''}
     ORDER BY v.patente
     OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY`,
    [
      { name: 'offset',   type: sql.Int, value: offset },
      { name: 'pageSize', type: sql.Int, value: pageSize },
    ]
  );

  const total = await queryOne(
    `SELECT COUNT(*) AS total FROM flota.Vehiculo ${soloActivos ? 'WHERE activo = 1' : ''}`,
    []
  );

  res.json({ data: result.recordset, page, pageSize, total: total.total });
});

// GET /api/vehiculos/:id
router.get('/:id', param('id').isInt(), async (req, res) => {
  const vehiculo = await queryOne(
    `SELECT v.*, e.codigo AS estado, e.descripcion AS estado_desc,
            p.rut AS rut_propietario, p.nombre AS nombre_propietario,
            p.direccion AS direccion_propietario, p.telefono AS telefono_propietario,
            p.email AS email_propietario
     FROM flota.Vehiculo v
     JOIN config.EstadoVehiculo e ON e.id_estado = v.id_estado
     LEFT JOIN flota.Propietario p ON p.id_propietario = v.id_propietario
     WHERE v.id_vehiculo = @id`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );
  if (!vehiculo) return res.status(404).json({ error: 'Vehículo no encontrado' });

  const documentos = await query(
    `SELECT * FROM flota.DocumentoVehiculo WHERE id_vehiculo = @id AND activo = 1 ORDER BY tipo_documento`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  const historial = await query(
    `SELECT h.*, e.codigo AS estado_nuevo_cod
     FROM flota.HistorialEstadoVehiculo h
     JOIN config.EstadoVehiculo e ON e.id_estado = h.id_estado_nuevo
     WHERE h.id_vehiculo = @id ORDER BY h.fecha_cambio DESC`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  const contrato = await queryOne(
    `SELECT TOP 1 id_imagen, fecha_subida
     FROM flota.ImagenVehiculo
     WHERE id_vehiculo = @id AND tipo = 'CONTRATO_SERVICIO'
     ORDER BY fecha_subida DESC`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );

  res.json({
    ...vehiculo,
    documentos: documentos.recordset,
    historial: historial.recordset,
    contrato_pdf: contrato ? { id_imagen: contrato.id_imagen, fecha_subida: contrato.fecha_subida } : null,
  });
});

// POST /api/vehiculos
router.post('/',
  authorize('ADMIN', 'OPERADOR'),
  body('patente').notEmpty().trim().toUpperCase()
    .custom((value) => validarPatente(value)).withMessage('Patente inválida (formato esperado: LLLL-NN)'),
  body('id_estado').isInt({ min: 1 }),
  body('fecha_ingreso').isISO8601(),
  body('rut_propietario').optional({ checkFalsy: true }).trim()
    .custom((value) => validarRut(value)).withMessage('RUT de propietario inválido'),
  body('nombre_propietario').optional().trim(),
  body('direccion_propietario').optional().trim(),
  body('telefono_propietario').optional().trim(),
  body('email_propietario').optional({ checkFalsy: true }).isEmail(),
  body('codigo_linea').optional().trim(),
  body('contrato_servicio').optional().trim(),
  body('observaciones').optional().trim(),
  body('permiso_circulacion').optional().isISO8601(),
  body('seguro_obligatorio').optional().isISO8601(),
  body('revision_tecnica').optional().isISO8601(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const {
      patente, id_estado, fecha_ingreso, obs_retiro, observaciones,
      rut_propietario, nombre_propietario, direccion_propietario,
      telefono_propietario, email_propietario, codigo_linea, contrato_servicio,
      permiso_circulacion, seguro_obligatorio, revision_tecnica,
    } = req.body;

    const patenteNormalizada = formatearPatente(patente);

    let id_propietario = null;
    if (rut_propietario) {
      const rutNormalizado = formatearRut(rut_propietario);
      const existente = await queryOne(
        `SELECT id_propietario FROM flota.Propietario WHERE rut = @rut`,
        [{ name: 'rut', type: sql.VarChar(12), value: rutNormalizado }]
      );
      if (existente) {
        id_propietario = existente.id_propietario;
      } else {
        const nuevo = await query(
          `INSERT INTO flota.Propietario (rut, nombre, direccion, telefono, email)
           OUTPUT INSERTED.id_propietario
           VALUES (@rut, @nombre, @direccion, @telefono, @email)`,
          [
            { name: 'rut',       type: sql.VarChar(12),  value: rutNormalizado },
            { name: 'nombre',    type: sql.VarChar(150), value: nombre_propietario || rutNormalizado },
            { name: 'direccion', type: sql.VarChar(300), value: direccion_propietario || null },
            { name: 'telefono',  type: sql.VarChar(20),  value: telefono_propietario || null },
            { name: 'email',     type: sql.VarChar(150), value: email_propietario || null },
          ]
        );
        id_propietario = nuevo.recordset[0].id_propietario;
      }
    }

    const result = await query(
      `INSERT INTO flota.Vehiculo (
         patente, id_estado, fecha_ingreso, obs_retiro, observaciones, id_usuario_reg,
         id_propietario, codigo_linea, contrato_servicio
       )
       OUTPUT INSERTED.id_vehiculo
       VALUES (
         @patente, @id_estado, @fecha_ingreso, @obs, @observaciones, @usr,
         @idPropietario, @codigoLinea, @contratoServicio
       )`,
      [
        { name: 'patente',       type: sql.VarChar(10),  value: patenteNormalizada },
        { name: 'id_estado',     type: sql.TinyInt,      value: id_estado },
        { name: 'fecha_ingreso', type: sql.Date,         value: fecha_ingreso },
        { name: 'obs',           type: sql.VarChar(500), value: obs_retiro ?? null },
        { name: 'observaciones', type: sql.VarChar(500), value: observaciones ?? null },
        { name: 'usr',           type: sql.Int,          value: req.user.id },
        { name: 'idPropietario',    type: sql.Int,          value: id_propietario },
        { name: 'codigoLinea',      type: sql.VarChar(20),  value: codigo_linea || null },
        { name: 'contratoServicio', type: sql.VarChar(255), value: contrato_servicio || null },
      ]
    );

    const id_vehiculo = result.recordset[0].id_vehiculo;

    const documentos = [
      { tipo: 'PERMISO_CIRCULACION', fecha: permiso_circulacion },
      { tipo: 'SEGURO_OBLIGATORIO',  fecha: seguro_obligatorio },
      { tipo: 'REVISION_TECNICA',    fecha: revision_tecnica },
    ].filter((d) => d.fecha);

    for (const doc of documentos) {
      await query(
        `INSERT INTO flota.DocumentoVehiculo (id_vehiculo, tipo_documento, fecha_vencimiento)
         VALUES (@id, @tipo, @fecha)`,
        [
          { name: 'id',    type: sql.Int,         value: id_vehiculo },
          { name: 'tipo',  type: sql.VarChar(30), value: doc.tipo },
          { name: 'fecha', type: sql.Date,        value: doc.fecha },
        ]
      );
    }

    res.status(201).json({ id_vehiculo });
  }
);

// PUT /api/vehiculos/:id
router.put('/:id',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  body('id_estado').optional().isInt({ min: 1 }),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { id_estado, fecha_retiro, obs_retiro, motivo_estado, justifica_desde, justifica_hasta } = req.body;
    const id = parseInt(req.params.id);

    const actual = await queryOne(
      `SELECT id_estado FROM flota.Vehiculo WHERE id_vehiculo = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!actual) return res.status(404).json({ error: 'Vehículo no encontrado' });

    await query(
      `UPDATE flota.Vehiculo SET
         id_estado     = ISNULL(@id_estado, id_estado),
         fecha_retiro  = ISNULL(@fecha_retiro, fecha_retiro),
         obs_retiro    = ISNULL(@obs, obs_retiro)
       WHERE id_vehiculo = @id`,
      [
        { name: 'id_estado',    type: sql.TinyInt,      value: id_estado ?? null },
        { name: 'fecha_retiro', type: sql.Date,         value: fecha_retiro ?? null },
        { name: 'obs',          type: sql.VarChar(500), value: obs_retiro ?? null },
        { name: 'id',           type: sql.Int,          value: id },
      ]
    );

    if (id_estado && id_estado !== actual.id_estado) {
      await query(
        `INSERT INTO flota.HistorialEstadoVehiculo
           (id_vehiculo, id_estado_anterior, id_estado_nuevo, motivo, justifica_desde, justifica_hasta, id_usuario)
         VALUES (@vid, @ant, @nuevo, @motivo, @jd, @jh, @usr)`,
        [
          { name: 'vid',    type: sql.Int,          value: id },
          { name: 'ant',    type: sql.TinyInt,      value: actual.id_estado },
          { name: 'nuevo',  type: sql.TinyInt,      value: id_estado },
          { name: 'motivo', type: sql.VarChar(500), value: motivo_estado ?? null },
          { name: 'jd',     type: sql.Date,         value: justifica_desde ?? null },
          { name: 'jh',     type: sql.Date,         value: justifica_hasta ?? null },
          { name: 'usr',    type: sql.Int,          value: req.user.id },
        ]
      );
    }

    res.json({ ok: true });
  }
);

// POST /api/vehiculos/:id/contrato — sube el contrato de servicio (PDF)
router.post('/:id/contrato',
  authorize('ADMIN', 'OPERADOR'),
  param('id').isInt(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const id = parseInt(req.params.id);
    const vehiculo = await queryOne(
      `SELECT id_vehiculo FROM flota.Vehiculo WHERE id_vehiculo = @id`,
      [{ name: 'id', type: sql.Int, value: id }]
    );
    if (!vehiculo) return res.status(404).json({ error: 'Vehículo no encontrado' });

    uploadContrato.single('contrato')(req, res, async (err) => {
      if (err) return res.status(400).json({ error: err.message });
      if (!req.file) return res.status(400).json({ error: 'Debe adjuntar el archivo del contrato' });

      const nuevo = await query(
        `INSERT INTO flota.ImagenVehiculo (id_vehiculo, tipo, ruta_archivo)
         OUTPUT INSERTED.id_imagen, INSERTED.fecha_subida
         VALUES (@id, 'CONTRATO_SERVICIO', @ruta)`,
        [
          { name: 'id',    type: sql.Int,          value: id },
          { name: 'ruta',  type: sql.VarChar(500), value: req.file.filename },
        ]
      );

      res.status(201).json(nuevo.recordset[0]);
    });
  }
);

// GET /api/vehiculos/:id/contrato — descarga/visualiza el contrato de servicio vigente (PDF)
router.get('/:id/contrato', param('id').isInt(), async (req, res) => {
  const contrato = await queryOne(
    `SELECT TOP 1 ruta_archivo
     FROM flota.ImagenVehiculo
     WHERE id_vehiculo = @id AND tipo = 'CONTRATO_SERVICIO'
     ORDER BY fecha_subida DESC`,
    [{ name: 'id', type: sql.Int, value: req.params.id }]
  );
  if (!contrato) return res.status(404).json({ error: 'Este vehículo no tiene contrato de servicio cargado' });

  const rutaAbsoluta = path.join(CARPETA_CONTRATOS, path.basename(contrato.ruta_archivo));
  if (!fs.existsSync(rutaAbsoluta)) return res.status(404).json({ error: 'El archivo del contrato no se encuentra en el servidor' });

  res.setHeader('Content-Type', 'application/pdf');
  res.setHeader('Content-Disposition', 'inline; filename="contrato-servicio.pdf"');
  res.sendFile(rutaAbsoluta);
});

// GET /api/vehiculos/vencimientos/proximos
router.get('/vencimientos/proximos', async (req, res) => {
  const dias = parseInt(req.query.dias) || 30;
  const result = await query(
    `SELECT v.patente, d.tipo_documento, d.fecha_vencimiento,
            DATEDIFF(DAY, CAST(GETDATE() AS DATE), d.fecha_vencimiento) AS dias_restantes
     FROM flota.DocumentoVehiculo d
     JOIN flota.Vehiculo v ON v.id_vehiculo = d.id_vehiculo
     WHERE d.activo = 1
       AND v.activo = 1
       AND d.fecha_vencimiento <= DATEADD(DAY, @dias, CAST(GETDATE() AS DATE))
     ORDER BY d.fecha_vencimiento ASC`,
    [{ name: 'dias', type: sql.Int, value: dias }]
  );
  res.json(result.recordset);
});

module.exports = router;
