-- =============================================================================
-- SERVITACO - Hito Conductores
-- Rama: feature-mant_vehiculo
--
-- Campos detectados en SERVITACO_V11_2026.xlsm (hoja BASE_COND) que no
-- estaban migrados: OBS, y catálogo de tipos de licencia incompleto.
-- La asignación vehículo-conductor NO se toca acá: ya existe modelada en
-- flota.AsignacionVehiculoConductor (tabla aparte, opcional) desde 01_schema.sql.
-- =============================================================================

SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE ServitacoDB;
GO

-- Observaciones generales del conductor (distinto de obs_retiro).
ALTER TABLE flota.Conductor ADD
    observaciones VARCHAR(500) NULL;
GO

-- Backfill generado desde SERVITACO_V11_2026.xlsm (hoja BASE_COND, columna OBS).
-- Solo 1 conductor con observación operativa relevante (el resto era "OK"/"NA").
UPDATE flota.Conductor SET observaciones = 'LICENCIA NO AUTORIZADA PARA COLECTIVO' WHERE rut = '8225407-2';
GO

-- El catálogo original solo tenía 2 tipos; la columna TIPO_LICENCIA del Excel
-- tiene 3 valores reales de fondo (con variantes de formato): "A" (genérico),
-- "Ley 18290 A1", "Ley 19495 A1-A3" (a veces con espacio extra).
INSERT INTO config.TipoLicencia (id_tipo_licencia, codigo, descripcion, ley_referencia) VALUES
(3, 'A', 'Licencia clase A (general)', NULL);
GO

-- Imágenes del conductor (foto del conductor, foto de la licencia).
CREATE TABLE flota.ImagenConductor (
    id_imagen           INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    tipo                VARCHAR(50)     NOT NULL,  -- 'FOTO_CONDUCTOR','FOTO_LICENCIA'
    ruta_archivo        VARCHAR(500)    NOT NULL,
    fecha_subida        DATETIME2       NOT NULL DEFAULT SYSDATETIME()
);
GO
