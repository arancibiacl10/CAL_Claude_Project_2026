const logger = require('../utils/logger');

function errorHandler(err, _req, res, _next) {
  logger.error(err.message, err);

  if (err.name === 'ValidationError') {
    return res.status(400).json({ error: err.message });
  }
  if (err.name === 'UnauthorizedError' || err.status === 401) {
    return res.status(401).json({ error: 'No autorizado' });
  }
  if (err.status === 403) {
    return res.status(403).json({ error: 'Acceso denegado' });
  }
  if (err.status === 404) {
    return res.status(404).json({ error: 'Recurso no encontrado' });
  }

  const status  = err.status || 500;
  const message = process.env.NODE_ENV === 'production' ? 'Error interno del servidor' : err.message;
  return res.status(status).json({ error: message });
}

module.exports = errorHandler;
