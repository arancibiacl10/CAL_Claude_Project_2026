const router  = require('express').Router();
const bcrypt  = require('bcryptjs');
const jwt     = require('jsonwebtoken');
const { body, validationResult } = require('express-validator');
const { queryOne, sql } = require('../db/queries');
const { authenticate } = require('../middleware/auth');

router.post('/login',
  body('username').notEmpty().trim(),
  body('password').notEmpty(),
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { username, password } = req.body;

    const user = await queryOne(
      `SELECT u.id_usuario, u.username, u.password_hash, u.nombre_completo, u.email,
              u.activo, r.nombre AS rol
       FROM seguridad.Usuario u
       JOIN seguridad.Rol r ON r.id_rol = u.id_rol
       WHERE u.username = @username`,
      [{ name: 'username', type: sql.VarChar(50), value: username }]
    );

    if (!user || !user.activo) {
      return res.status(401).json({ error: 'Credenciales inválidas' });
    }

    const valid = await bcrypt.compare(password, user.password_hash);
    if (!valid) return res.status(401).json({ error: 'Credenciales inválidas' });

    // Actualizar último acceso
    await queryOne(
      `UPDATE seguridad.Usuario SET ultimo_acceso = SYSDATETIME() WHERE id_usuario = @id`,
      [{ name: 'id', type: sql.Int, value: user.id_usuario }]
    );

    const token = jwt.sign(
      { id: user.id_usuario, username: user.username, rol: user.rol, nombre: user.nombre_completo },
      process.env.JWT_SECRET,
      { expiresIn: process.env.JWT_EXPIRES_IN || '8h' }
    );

    res.json({
      token,
      user: { id: user.id_usuario, username: user.username, nombre: user.nombre_completo, rol: user.rol },
    });
  }
);

router.get('/me', authenticate, (req, res) => res.json(req.user));

module.exports = router;
