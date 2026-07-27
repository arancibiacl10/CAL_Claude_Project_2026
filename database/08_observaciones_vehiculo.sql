-- =============================================================================
-- SERVITACO - Observaciones generales del vehículo
-- Rama: feature-mant_vehiculo
-- Campo "OBS" del sistema legado (distinto de obs_retiro, que es específico
-- del motivo de baja). Nunca se migró a SQL Server.
-- =============================================================================

SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE ServitacoDB;
GO

ALTER TABLE flota.Vehiculo ADD
    observaciones VARCHAR(500) NULL;
GO

-- Backfill generado desde SERVITACO_V11_2026.xlsm (hoja BASE_AUTOS, columna OBS)
-- 13 vehículos con observación no vacía.
UPDATE flota.Vehiculo SET observaciones = 'remplaza a CXWR-69' WHERE patente = 'PVSD-58';
UPDATE flota.Vehiculo SET observaciones = 'REMPLAZA A FDVZ-57 DESDE 23-03-2026' WHERE patente = 'PVSD-68';
UPDATE flota.Vehiculo SET observaciones = 'SIN CHOFER DESDE 06-01-2025' WHERE patente = 'GYCY-50';
UPDATE flota.Vehiculo SET observaciones = 'TALLER' WHERE patente = 'HGGK-75';
UPDATE flota.Vehiculo SET observaciones = 'REMPLAZA AL BXWY-97 DESDE 23-03-2026' WHERE patente = 'JWHC-56';
UPDATE flota.Vehiculo SET observaciones = 'remplaza a JWVS-56 /04-02-2026' WHERE patente = 'RPFY-69';
UPDATE flota.Vehiculo SET observaciones = 'OK' WHERE patente = 'KCXP-40';
UPDATE flota.Vehiculo SET observaciones = 'sin chofer' WHERE patente = 'KYGL-91';
UPDATE flota.Vehiculo SET observaciones = 'REMPLAZA A PLTZ-97/04-03-2026' WHERE patente = 'PVSR-16';
UPDATE flota.Vehiculo SET observaciones = 'OK' WHERE patente = 'PVPR-33';
UPDATE flota.Vehiculo SET observaciones = 'OK' WHERE patente = 'PVRC-71';
UPDATE flota.Vehiculo SET observaciones = 'renovación auto saliente PPU CYVG-21' WHERE patente = 'PVRH-71';
UPDATE flota.Vehiculo SET observaciones = 'VEHICULO REEMPLAZA A GBZV-10' WHERE patente = 'VHDP-18';
GO
