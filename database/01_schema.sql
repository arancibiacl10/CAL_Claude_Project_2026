-- =============================================================================
-- SERVITACO - Sistema de Gestión de Transporte
-- Modelo Relacional SQL Server
-- Versión: 1.0 | 2026
-- =============================================================================

SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'ServitacoDB')
    CREATE DATABASE ServitacoDB
        COLLATE Modern_Spanish_CI_AS;
GO

USE ServitacoDB;
GO

-- =============================================================================
-- ESQUEMAS
-- =============================================================================
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'flota')    EXEC('CREATE SCHEMA flota');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'operacion') EXEC('CREATE SCHEMA operacion');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'finanzas')  EXEC('CREATE SCHEMA finanzas');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'config')    EXEC('CREATE SCHEMA config');
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'seguridad') EXEC('CREATE SCHEMA seguridad');
GO

-- =============================================================================
-- SCHEMA: config  (tablas de referencia / parámetros)
-- =============================================================================

CREATE TABLE config.TipoLicencia (
    id_tipo_licencia    TINYINT         NOT NULL PRIMARY KEY,
    codigo              VARCHAR(20)     NOT NULL UNIQUE,   -- 'A1', 'A3', etc.
    descripcion         VARCHAR(100)    NOT NULL,
    ley_referencia      VARCHAR(50)     NULL               -- 'Ley 18290', 'Ley 19495'
);

CREATE TABLE config.EstadoVehiculo (
    id_estado           TINYINT         NOT NULL PRIMARY KEY,
    codigo              VARCHAR(20)     NOT NULL UNIQUE,   -- 'AUTORIZADO','EN_TALLER','PERMISO','DENEGADO'
    descripcion         VARCHAR(100)    NOT NULL,
    activo              BIT             NOT NULL DEFAULT 1
);

CREATE TABLE config.Feriado (
    id_feriado          INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    fecha               DATE            NOT NULL UNIQUE,
    descripcion         VARCHAR(150)    NOT NULL,
    irrenunciable       BIT             NOT NULL DEFAULT 0
);

CREATE TABLE config.Parametro (
    clave               VARCHAR(50)     NOT NULL PRIMARY KEY,
    valor               VARCHAR(500)    NOT NULL,
    descripcion         VARCHAR(200)    NULL,
    ultima_modificacion DATETIME2       NOT NULL DEFAULT SYSDATETIME()
    -- Ejemplos de claves:
    -- 'VALOR_DIARIO', 'VALOR_MULTA', 'HORA_SALIDA', 'HORA_LLEGADA'
    -- 'NOMBRE_EMPRESA', 'LINEA', 'CIUDAD', 'DIRECCION_TERMINAL'
);

-- =============================================================================
-- SCHEMA: seguridad  (usuarios del sistema)
-- =============================================================================

CREATE TABLE seguridad.Rol (
    id_rol              TINYINT         NOT NULL PRIMARY KEY,
    nombre              VARCHAR(50)     NOT NULL UNIQUE,   -- 'ADMIN','OPERADOR','CONSULTA'
    descripcion         VARCHAR(200)    NULL
);

CREATE TABLE seguridad.Usuario (
    id_usuario          INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    username            VARCHAR(50)     NOT NULL UNIQUE,
    password_hash       VARCHAR(256)    NOT NULL,
    nombre_completo     VARCHAR(150)    NOT NULL,
    email               VARCHAR(150)    NULL,
    id_rol              TINYINT         NOT NULL REFERENCES seguridad.Rol(id_rol),
    activo              BIT             NOT NULL DEFAULT 1,
    ultimo_acceso       DATETIME2       NULL,
    fecha_creacion      DATETIME2       NOT NULL DEFAULT SYSDATETIME()
);

-- =============================================================================
-- SCHEMA: flota
-- =============================================================================

CREATE TABLE flota.Vehiculo (
    id_vehiculo         INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    patente             VARCHAR(10)     NOT NULL UNIQUE,       -- 'BXSH-97'
    id_estado           TINYINT         NOT NULL REFERENCES config.EstadoVehiculo(id_estado),
    fecha_ingreso       DATE            NOT NULL,
    fecha_retiro        DATE            NULL,
    obs_retiro          VARCHAR(500)    NULL,
    activo              AS (CASE WHEN fecha_retiro IS NULL THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END) PERSISTED,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    id_usuario_reg      INT             NULL REFERENCES seguridad.Usuario(id_usuario)
);

-- Documentación y vencimientos del vehículo
CREATE TABLE flota.DocumentoVehiculo (
    id_doc              INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    tipo_documento      VARCHAR(30)     NOT NULL,  -- 'PERMISO_CIRCULACION','SEGURO_OBLIGATORIO','REVISION_TECNICA'
    fecha_vencimiento   DATE            NOT NULL,
    fecha_emision       DATE            NULL,
    numero_documento    VARCHAR(100)    NULL,
    observaciones       VARCHAR(500)    NULL,
    activo              BIT             NOT NULL DEFAULT 1,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT uq_doc_vehiculo_tipo_vigente UNIQUE (id_vehiculo, tipo_documento, activo)
);

-- Imágenes del vehículo (contrato, foto, etc.)
CREATE TABLE flota.ImagenVehiculo (
    id_imagen           INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    tipo                VARCHAR(50)     NOT NULL,  -- 'FOTO_VEHICULO','CONTRATO_SERVICIO'
    ruta_archivo        VARCHAR(500)    NOT NULL,
    fecha_subida        DATETIME2       NOT NULL DEFAULT SYSDATETIME()
);

-- Historial de estados del vehículo
CREATE TABLE flota.HistorialEstadoVehiculo (
    id_historial        INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    id_estado_anterior  TINYINT         NULL REFERENCES config.EstadoVehiculo(id_estado),
    id_estado_nuevo     TINYINT         NOT NULL REFERENCES config.EstadoVehiculo(id_estado),
    fecha_cambio        DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    motivo              VARCHAR(500)    NULL,
    justifica_desde     DATE            NULL,
    justifica_hasta     DATE            NULL,
    id_usuario          INT             NULL REFERENCES seguridad.Usuario(id_usuario)
);

-- =============================================================================
-- Conductores
-- =============================================================================

CREATE TABLE flota.Conductor (
    id_conductor        INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    rut                 VARCHAR(12)     NOT NULL UNIQUE,   -- '6017825-9'
    nombre              VARCHAR(150)    NOT NULL,
    apellido_paterno    VARCHAR(100)    NULL,
    apellido_materno    VARCHAR(100)    NULL,
    direccion           VARCHAR(300)    NULL,
    telefono            VARCHAR(20)     NULL,
    email               VARCHAR(150)    NULL,
    fecha_ingreso       DATE            NULL,
    fecha_retiro        DATE            NULL,
    obs_retiro          VARCHAR(500)    NULL,
    activo              AS (CASE WHEN fecha_retiro IS NULL THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END) PERSISTED,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    id_usuario_reg      INT             NULL REFERENCES seguridad.Usuario(id_usuario)
);

-- Licencias del conductor
CREATE TABLE flota.LicenciaConductor (
    id_licencia         INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    id_tipo_licencia    TINYINT         NOT NULL REFERENCES config.TipoLicencia(id_tipo_licencia),
    numero_licencia     VARCHAR(50)     NULL,
    fecha_emision       DATE            NULL,
    fecha_vencimiento   DATE            NOT NULL,
    observaciones       VARCHAR(500)    NULL,
    activa              BIT             NOT NULL DEFAULT 1,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME()
);

-- Asignación vehículo-conductor (un conductor puede operar distintos vehículos en el tiempo)
CREATE TABLE flota.AsignacionVehiculoConductor (
    id_asignacion       INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    fecha_desde         DATE            NOT NULL,
    fecha_hasta         DATE            NULL,        -- NULL = asignación vigente
    es_titular          BIT             NOT NULL DEFAULT 1,
    observaciones       VARCHAR(500)    NULL,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT uq_asignacion_vigente UNIQUE (id_vehiculo, id_conductor, fecha_desde)
);

-- =============================================================================
-- SCHEMA: operacion
-- =============================================================================

CREATE TABLE operacion.HojaRuta (
    id_hoja_ruta        INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    fecha               DATE            NOT NULL,
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    hora_salida         TIME            NULL,
    hora_llegada        TIME            NULL,
    km_salida           DECIMAL(10,1)   NULL,
    km_llegada          DECIMAL(10,1)   NULL,
    km_recorridos       AS (CASE WHEN km_llegada IS NOT NULL AND km_salida IS NOT NULL
                               THEN km_llegada - km_salida ELSE NULL END) PERSISTED,
    observaciones       VARCHAR(500)    NULL,
    estado              VARCHAR(20)     NOT NULL DEFAULT 'PENDIENTE',  -- 'PENDIENTE','COMPLETADA','ANULADA'
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    id_usuario_reg      INT             NULL REFERENCES seguridad.Usuario(id_usuario),
    CONSTRAINT uq_hoja_ruta_dia UNIQUE (fecha, id_vehiculo)
);

-- Detalle de paradas / eventos en la hoja de ruta
CREATE TABLE operacion.DetalleHojaRuta (
    id_detalle          INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_hoja_ruta        INT             NOT NULL REFERENCES operacion.HojaRuta(id_hoja_ruta),
    orden               TINYINT         NOT NULL,
    descripcion         VARCHAR(200)    NULL,
    hora_evento         TIME            NULL,
    observaciones       VARCHAR(300)    NULL
);

-- Control mensual de operación (equivale a CONTROL_ENERO ... CONTROL_DICIEMBRE)
CREATE TABLE operacion.ControlMensual (
    id_control          INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    anio                SMALLINT        NOT NULL,
    mes                 TINYINT         NOT NULL,   -- 1-12
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    fecha               DATE            NOT NULL,
    estado_dia          VARCHAR(20)     NOT NULL DEFAULT 'TRABAJO',
    -- 'TRABAJO','DESCANSO','FERIADO','PERMISO','AUSENTE','SIN_SERVICIO'
    id_hoja_ruta        INT             NULL REFERENCES operacion.HojaRuta(id_hoja_ruta),
    observaciones       VARCHAR(300)    NULL,
    CONSTRAINT uq_control_mensual UNIQUE (fecha, id_vehiculo, id_conductor)
);

-- Horas trabajadas por conductor
CREATE TABLE operacion.ControlHoras (
    id_control_horas    INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    id_hoja_ruta        INT             NOT NULL REFERENCES operacion.HojaRuta(id_hoja_ruta),
    fecha               DATE            NOT NULL,
    hora_inicio         TIME            NULL,
    hora_fin            TIME            NULL,
    horas_trabajadas    AS (CASE
                            WHEN hora_inicio IS NOT NULL AND hora_fin IS NOT NULL
                            THEN CAST(DATEDIFF(MINUTE, hora_inicio, hora_fin) / 60.0 AS DECIMAL(5,2))
                            ELSE NULL END) PERSISTED,
    tipo_jornada        VARCHAR(30)     NULL,  -- 'NORMAL','EXTRA','FERIADO'
    observaciones       VARCHAR(300)    NULL,
    CONSTRAINT uq_horas_conductor_dia UNIQUE (id_conductor, fecha)
);

-- =============================================================================
-- SCHEMA: finanzas
-- =============================================================================

-- Recaudación diaria por vehículo
CREATE TABLE finanzas.Recaudacion (
    id_recaudacion      INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    fecha               DATE            NOT NULL,
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    id_hoja_ruta        INT             NULL REFERENCES operacion.HojaRuta(id_hoja_ruta),
    monto_bruto         DECIMAL(12,2)   NOT NULL DEFAULT 0,
    descuentos          DECIMAL(12,2)   NOT NULL DEFAULT 0,
    monto_neto          AS (monto_bruto - descuentos) PERSISTED,
    tipo_pago           VARCHAR(20)     NOT NULL DEFAULT 'NORMAL',  -- 'NORMAL','ADELANTADO','ATRASADO'
    observaciones       VARCHAR(500)    NULL,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    id_usuario_reg      INT             NULL REFERENCES seguridad.Usuario(id_usuario),
    CONSTRAINT uq_recaudacion_dia_vehiculo UNIQUE (fecha, id_vehiculo)
);

-- Pagos adelantados (equivale a hoja PAGO_ADELANTADO)
CREATE TABLE finanzas.PagoAdelantado (
    id_pago             INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    fecha_pago          DATE            NOT NULL,
    fecha_periodo_desde DATE            NOT NULL,
    fecha_periodo_hasta DATE            NOT NULL,
    monto               DECIMAL(12,2)   NOT NULL,
    observaciones       VARCHAR(500)    NULL,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    id_usuario_reg      INT             NULL REFERENCES seguridad.Usuario(id_usuario)
);

-- Pagos atrasados / deudas (equivale a hoja PAGO_ATRASADO)
CREATE TABLE finanzas.PagoAtrasado (
    id_deuda            INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_conductor        INT             NOT NULL REFERENCES flota.Conductor(id_conductor),
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    fecha_origen        DATE            NOT NULL,       -- fecha en que se generó la deuda
    fecha_pago          DATE            NULL,           -- NULL = pendiente de pago
    monto_deuda         DECIMAL(12,2)   NOT NULL,
    monto_pagado        DECIMAL(12,2)   NOT NULL DEFAULT 0,
    saldo_pendiente     AS (monto_deuda - monto_pagado) PERSISTED,
    motivo              VARCHAR(300)    NULL,
    estado              VARCHAR(20)     NOT NULL DEFAULT 'PENDIENTE',  -- 'PENDIENTE','PAGADO','ANULADO'
    observaciones       VARCHAR(500)    NULL,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    id_usuario_reg      INT             NULL REFERENCES seguridad.Usuario(id_usuario)
);

-- =============================================================================
-- ÍNDICES
-- =============================================================================

-- flota
CREATE INDEX IX_Vehiculo_Estado        ON flota.Vehiculo (id_estado);
CREATE INDEX IX_DocVehiculo_Vencim     ON flota.DocumentoVehiculo (id_vehiculo, fecha_vencimiento);
CREATE INDEX IX_Conductor_RUT          ON flota.Conductor (rut);
CREATE INDEX IX_Licencia_Vencim        ON flota.LicenciaConductor (id_conductor, fecha_vencimiento);
CREATE INDEX IX_Asignacion_Vigente     ON flota.AsignacionVehiculoConductor (id_vehiculo, fecha_hasta);

-- operacion
CREATE INDEX IX_HojaRuta_Fecha         ON operacion.HojaRuta (fecha, id_vehiculo);
CREATE INDEX IX_HojaRuta_Conductor     ON operacion.HojaRuta (id_conductor, fecha);
CREATE INDEX IX_ControlMensual_Period  ON operacion.ControlMensual (anio, mes, id_vehiculo);
CREATE INDEX IX_ControlHoras_Conductor ON operacion.ControlHoras (id_conductor, fecha);

-- finanzas
CREATE INDEX IX_Recaudacion_Fecha      ON finanzas.Recaudacion (fecha, id_vehiculo);
CREATE INDEX IX_Recaudacion_Conductor  ON finanzas.Recaudacion (id_conductor, fecha);
CREATE INDEX IX_PagoAtrasado_Estado    ON finanzas.PagoAtrasado (estado, id_conductor);

GO

-- =============================================================================
-- DATOS INICIALES
-- =============================================================================

INSERT INTO config.EstadoVehiculo (id_estado, codigo, descripcion) VALUES
(1, 'AUTORIZADO',  'Vehículo autorizado para operar'),
(2, 'EN_TALLER',   'Vehículo en mantención o reparación'),
(3, 'PERMISO',     'Vehículo con permiso especial'),
(4, 'DENEGADO',    'Vehículo denegado / fuera de servicio');

INSERT INTO config.TipoLicencia (id_tipo_licencia, codigo, descripcion, ley_referencia) VALUES
(1, 'A1',    'Licencia clase A1',        'Ley 18290'),
(2, 'A1-A3', 'Licencia clase A1 - A3',   'Ley 19495');

INSERT INTO config.Parametro (clave, valor, descripcion) VALUES
('NOMBRE_EMPRESA',      'EMPRESA SERVITACO',    'Nombre de la empresa'),
('LINEA',               '105',                  'Número de línea'),
('CIUDAD',              'SAN FERNANDO',         'Ciudad de operación'),
('DIRECCION_TERMINAL',  'RUTA 1-45 KM. 03',    'Dirección del terminal'),
('VALOR_DIARIO',        '0',                    'Valor diario de operación (actualizar)'),
('VALOR_MULTA',         '0',                    'Valor de multa (actualizar)'),
('HORA_SALIDA',         '00:00',                'Hora de salida estándar'),
('HORA_LLEGADA',        '24:00',                'Hora de llegada estándar');

INSERT INTO seguridad.Rol (id_rol, nombre, descripcion) VALUES
(1, 'ADMIN',    'Administrador del sistema, acceso total'),
(2, 'OPERADOR', 'Operador, puede registrar operación diaria'),
(3, 'CONSULTA', 'Solo lectura y reportes');

GO
