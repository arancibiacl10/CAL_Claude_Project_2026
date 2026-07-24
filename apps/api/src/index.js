require('dotenv').config();
require('express-async-errors');

const express = require('express');
const helmet  = require('helmet');
const cors    = require('cors');

const { connectDB } = require('./db/connection');
const logger        = require('./utils/logger');
const errorHandler  = require('./middleware/errorHandler');
const rateLimiter   = require('./middleware/rateLimiter');

const authRoutes        = require('./routes/auth.routes');
const vehiculoRoutes    = require('./routes/vehiculo.routes');
const conductorRoutes   = require('./routes/conductor.routes');
const hojaRutaRoutes    = require('./routes/hojaRuta.routes');
const controlRoutes     = require('./routes/control.routes');
const recaudacionRoutes = require('./routes/recaudacion.routes');
const pagoRoutes        = require('./routes/pago.routes');
const reporteRoutes     = require('./routes/reporte.routes');
const configRoutes      = require('./routes/config.routes');

const app  = express();
const PORT = process.env.PORT || 3001;

app.use(helmet());
app.use(cors({ origin: process.env.CORS_ORIGIN || 'http://localhost:5173' }));
app.use(express.json());
app.use(rateLimiter);

app.get('/health', (_req, res) => res.json({ status: 'ok', ts: new Date() }));

app.use('/api/auth',         authRoutes);
app.use('/api/vehiculos',    vehiculoRoutes);
app.use('/api/conductores',  conductorRoutes);
app.use('/api/hoja-ruta',    hojaRutaRoutes);
app.use('/api/control',      controlRoutes);
app.use('/api/recaudacion',  recaudacionRoutes);
app.use('/api/pagos',        pagoRoutes);
app.use('/api/reportes',     reporteRoutes);
app.use('/api/config',       configRoutes);

app.use(errorHandler);

(async () => {
  await connectDB();
  app.listen(PORT, () => logger.info(`API Servitaco escuchando en puerto ${PORT}`));
})();
