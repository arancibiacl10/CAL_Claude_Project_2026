-- =============================================================================
-- SERVITACO - Corrección de fecha_retiro en Conductor
-- Rama: feature-mant_vehiculo
--
-- Causa raíz: la migración de conductores (05_migracion_excel.sql, generado
-- por generate_migration.ps1) copió la columna L (FECHA_RETIRO) del Excel tal
-- cual, sin el mismo filtro de sensatez que sí se aplicó a vehículos (columna
-- O, solo se acepta si cae en un rango pasado razonable). En BASE_COND, esa
-- columna funciona como fecha de vencimiento de contrato/permiso, no como
-- "fecha real de baja": para conductores vigentes queda una fecha futura
-- (ej. 2030-12-31) en vez de NULL, lo que hace que la columna calculada
-- "activo" (NULL = activo) los marque a todos como retirados.
--
-- Fix: si fecha_retiro es una fecha futura (aún no llegó), no representa una
-- baja real todavía -> se limpia a NULL. Mismo criterio que ya usa la
-- migración de vehículos.
-- =============================================================================

SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE ServitacoDB;
GO

UPDATE flota.Conductor
SET fecha_retiro = NULL
WHERE fecha_retiro > CAST(GETDATE() AS DATE);
GO
