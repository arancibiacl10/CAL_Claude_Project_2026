-- =============================================================================
-- SERVITACO - Datos iniciales de prueba / primer uso
-- Ejecutar DESPUÉS de 01_schema.sql
-- =============================================================================
USE ServitacoDB;
GO

-- Usuario administrador por defecto
-- Password: Admin2026! (bcrypt hash generado con saltRounds=10)
-- IMPORTANTE: Cambiar la contraseña en el primer acceso
INSERT INTO seguridad.Usuario (username, password_hash, nombre_completo, email, id_rol)
VALUES (
  'admin',
  '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.',  -- password: password (cambiar)
  'Administrador Sistema',
  'admin@servitaco.cl',
  1  -- ADMIN
);

-- Feriados Chile 2026 (principales)
INSERT INTO config.Feriado (fecha, descripcion, irrenunciable) VALUES
('2026-01-01', 'Año Nuevo',                                    1),
('2026-04-03', 'Viernes Santo',                                0),
('2026-04-04', 'Sábado Santo',                                 0),
('2026-05-01', 'Día del Trabajo',                              1),
('2026-05-21', 'Día de las Glorias Navales',                   0),
('2026-06-29', 'San Pedro y San Pablo',                        0),
('2026-07-16', 'Virgen del Carmen',                            0),
('2026-08-15', 'Asunción de la Virgen',                        0),
('2026-09-18', 'Fiestas Patrias',                              1),
('2026-09-19', 'Día de las Glorias del Ejército',              0),
('2026-10-12', 'Día de la Hispanidad',                         0),
('2026-10-31', 'Día de las Iglesias Evangélicas',              0),
('2026-11-01', 'Día de Todos los Santos',                      0),
('2026-12-08', 'Inmaculada Concepción',                        0),
('2026-12-25', 'Navidad',                                      1);

GO
