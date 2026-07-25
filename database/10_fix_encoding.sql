-- =============================================================================
-- SERVITACO - Corrección de encoding en datos sembrados
-- Rama: feature-mant_vehiculo
--
-- Causa raíz: 01_schema.sql y 02_seed.sql no tienen BOM UTF-8, así que al
-- ejecutarlos con sqlcmd sin el flag -f 65001, los caracteres acentuados se
-- interpretaron con la codepage por defecto (no UTF-8), quedando cada
-- caracter multibyte guardado como dos caracteres sueltos (ej. 'í' -> 'Ã­').
-- 05_migracion_excel.sql sí tiene BOM y por eso esos datos están correctos.
--
-- Este script reescribe los valores afectados con el texto correcto tomado
-- directo de las fuentes (01_schema.sql / 02_seed.sql, ambas ya en UTF-8
-- correcto en el repositorio). No es una transformación automática de bytes:
-- son los mismos valores que ya estaban en el código, reinsertados tal cual.
-- =============================================================================

SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE ServitacoDB;
GO

UPDATE config.EstadoVehiculo SET descripcion = 'Vehículo autorizado para operar'      WHERE codigo = 'AUTORIZADO';
UPDATE config.EstadoVehiculo SET descripcion = 'Vehículo en mantención o reparación'  WHERE codigo = 'EN_TALLER';
UPDATE config.EstadoVehiculo SET descripcion = 'Vehículo con permiso especial'        WHERE codigo = 'PERMISO';
UPDATE config.EstadoVehiculo SET descripcion = 'Vehículo denegado / fuera de servicio' WHERE codigo = 'DENEGADO';
GO

UPDATE config.Parametro SET descripcion = 'Ciudad de operación'                    WHERE clave = 'CIUDAD';
UPDATE config.Parametro SET descripcion = 'Dirección del terminal'                 WHERE clave = 'DIRECCION_TERMINAL';
UPDATE config.Parametro SET descripcion = 'Hora de llegada estándar'               WHERE clave = 'HORA_LLEGADA';
UPDATE config.Parametro SET descripcion = 'Hora de salida estándar'                WHERE clave = 'HORA_SALIDA';
UPDATE config.Parametro SET descripcion = 'Número de línea'                        WHERE clave = 'LINEA';
UPDATE config.Parametro SET descripcion = 'Valor diario de operación (actualizar)' WHERE clave = 'VALOR_DIARIO';
GO

UPDATE seguridad.Rol SET descripcion = 'Operador, puede registrar operación diaria' WHERE nombre = 'OPERADOR';
GO

UPDATE config.Feriado SET descripcion = 'Año Nuevo'                              WHERE fecha = '2026-01-01';
UPDATE config.Feriado SET descripcion = 'Sábado Santo'                           WHERE fecha = '2026-04-04';
UPDATE config.Feriado SET descripcion = 'Día del Trabajo'                        WHERE fecha = '2026-05-01';
UPDATE config.Feriado SET descripcion = 'Día de las Glorias Navales'             WHERE fecha = '2026-05-21';
UPDATE config.Feriado SET descripcion = 'Asunción de la Virgen'                  WHERE fecha = '2026-08-15';
UPDATE config.Feriado SET descripcion = 'Día de las Glorias del Ejército'        WHERE fecha = '2026-09-19';
UPDATE config.Feriado SET descripcion = 'Día de la Hispanidad'                   WHERE fecha = '2026-10-12';
UPDATE config.Feriado SET descripcion = 'Día de las Iglesias Evangélicas'        WHERE fecha = '2026-10-31';
UPDATE config.Feriado SET descripcion = 'Día de Todos los Santos'                WHERE fecha = '2026-11-01';
UPDATE config.Feriado SET descripcion = 'Inmaculada Concepción'                  WHERE fecha = '2026-12-08';
GO
