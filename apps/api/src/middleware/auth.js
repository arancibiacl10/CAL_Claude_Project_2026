const jwt = require('jsonwebtoken');

function authenticate(req, _res, next) {
  const header = req.headers.authorization;
  if (!header || !header.startsWith('Bearer ')) {
    const err = new Error('Token requerido'); err.status = 401; throw err;
  }
  const token = header.split(' ')[1];
  try {
    req.user = jwt.verify(token, process.env.JWT_SECRET);
    next();
  } catch {
    const err = new Error('Token inválido o expirado'); err.status = 401; throw err;
  }
}

function authorize(...roles) {
  return (req, _res, next) => {
    if (!roles.includes(req.user.rol)) {
      const err = new Error('Sin permisos para esta acción'); err.status = 403; throw err;
    }
    next();
  };
}

module.exports = { authenticate, authorize };
