-- =============================================================================
-- SERVITACO - Normalización de Propietario
-- Rama: feature-mant_vehiculo
-- Un propietario puede tener varios vehículos (RUT es la llave única de
-- Propietario); Patente sigue siendo la llave única de control de Vehiculo.
-- Reemplaza los campos planos agregados en 07_datos_propietario_linea.sql.
-- =============================================================================

SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE ServitacoDB;
GO

CREATE TABLE flota.Propietario (
    id_propietario  INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    rut             VARCHAR(12)     NOT NULL UNIQUE,
    nombre          VARCHAR(150)    NOT NULL,
    direccion       VARCHAR(300)    NULL,
    telefono        VARCHAR(20)     NULL,
    email           VARCHAR(150)    NULL,
    fecha_registro  DATETIME2       NOT NULL DEFAULT SYSDATETIME()
);
GO

-- Un propietario por RUT (dedup mecánico: se conserva el primer vehículo
-- registrado con ese RUT; no se reconcilian inconsistencias de nombre).
;WITH dedup AS (
    SELECT
        rut_propietario, nombre_propietario, direccion_propietario,
        telefono_propietario, email_propietario,
        ROW_NUMBER() OVER (PARTITION BY rut_propietario ORDER BY id_vehiculo) AS rn
    FROM flota.Vehiculo
    WHERE rut_propietario IS NOT NULL
)
INSERT INTO flota.Propietario (rut, nombre, direccion, telefono, email)
SELECT rut_propietario, nombre_propietario, direccion_propietario, telefono_propietario, email_propietario
FROM dedup
WHERE rn = 1;
GO

ALTER TABLE flota.Vehiculo ADD id_propietario INT NULL REFERENCES flota.Propietario(id_propietario);
GO

UPDATE v
SET v.id_propietario = p.id_propietario
FROM flota.Vehiculo v
JOIN flota.Propietario p ON p.rut = v.rut_propietario;
GO

ALTER TABLE flota.Vehiculo DROP COLUMN
    rut_propietario, nombre_propietario, direccion_propietario,
    telefono_propietario, email_propietario;
GO

CREATE INDEX ix_vehiculo_propietario ON flota.Vehiculo (id_propietario);
GO
