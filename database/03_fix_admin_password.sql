USE ServitacoDB;
GO
-- Hash bcrypt para: Admin2026!
UPDATE seguridad.Usuario
SET password_hash = '$2a$10$g5CwQQ1eT6VZ/lqcbYE31ehgfAVIfwz6u6Ez4YbFRCRB3m1J9FLxm'
WHERE username = 'admin';

SELECT username, LEFT(password_hash, 20) + '...' AS hash_preview
FROM seguridad.Usuario;
GO
