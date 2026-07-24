USE ServitacoDB;
GO

-- Permisos explícitos por esquema
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::config    TO servitaco_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::seguridad TO servitaco_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::flota     TO servitaco_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::operacion TO servitaco_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::finanzas  TO servitaco_app;

PRINT 'Permisos por esquema asignados OK';
GO
