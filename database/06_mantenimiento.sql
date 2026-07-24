-- =============================================================================
-- SERVITACO - Módulo de Mantenimiento de Vehículos
-- Rama: feature-mant_vehiculo
-- =============================================================================

USE ServitacoDB;
GO

-- Registro de mantenimientos (preventivos/correctivos) por vehículo.
-- El próximo mantenimiento se programa por fecha (fecha_proximo).
CREATE TABLE flota.MantenimientoVehiculo (
    id_mantenimiento    INT             NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_vehiculo         INT             NOT NULL REFERENCES flota.Vehiculo(id_vehiculo),
    tipo_mantenimiento  VARCHAR(20)     NOT NULL,  -- 'PREVENTIVO','CORRECTIVO'
    estado              VARCHAR(20)     NOT NULL DEFAULT 'EN_CURSO',  -- 'EN_CURSO','FINALIZADO'
    fecha_inicio        DATE            NOT NULL,
    fecha_fin           DATE            NULL,
    km_actual           DECIMAL(10,1)   NULL,
    fecha_proximo       DATE            NULL,      -- próximo mantenimiento programado
    taller              VARCHAR(150)    NULL,
    costo               DECIMAL(12,2)   NULL,
    descripcion         VARCHAR(500)    NULL,       -- trabajo realizado / repuestos
    observaciones       VARCHAR(500)    NULL,
    fecha_registro      DATETIME2       NOT NULL DEFAULT SYSDATETIME(),
    id_usuario_reg      INT             NULL REFERENCES seguridad.Usuario(id_usuario),
    CONSTRAINT ck_mant_tipo   CHECK (tipo_mantenimiento IN ('PREVENTIVO','CORRECTIVO')),
    CONSTRAINT ck_mant_estado CHECK (estado IN ('EN_CURSO','FINALIZADO'))
);
GO

-- Un vehículo solo puede tener un mantenimiento EN_CURSO a la vez
CREATE UNIQUE INDEX uq_mant_vehiculo_en_curso
    ON flota.MantenimientoVehiculo (id_vehiculo)
    WHERE estado = 'EN_CURSO';
GO

CREATE INDEX ix_mant_proximo ON flota.MantenimientoVehiculo (fecha_proximo) WHERE fecha_proximo IS NOT NULL;
GO
