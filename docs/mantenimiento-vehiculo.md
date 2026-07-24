# Mantenimiento de Vehículos — punto de partida

Rama: `feature-mant_vehiculo`
Estado al momento de este documento: sin commits propios (mismo punto que `main`).

## Objetivo

Agregar un módulo de mantenimiento de vehículos (service, reparaciones, costos) que hoy no existe en el sistema.

## Qué ya existe (dominio "flota")

**Base de datos** (`database/01_schema.sql`):
- `flota.Vehiculo`
- `flota.DocumentoVehiculo`
- `flota.ImagenVehiculo`
- `flota.HistorialEstadoVehiculo`
- `flota.Conductor`
- `flota.LicenciaConductor`
- `flota.AsignacionVehiculoConductor`
- `config.EstadoVehiculo` — incluye el estado `EN_TALLER`, pero es solo una etiqueta de estado, no un registro de mantenimiento.

**API** (`apps/api/src/routes/vehiculo.routes.js`):
- `GET /api/vehiculos` — listado paginado
- `GET /api/vehiculos/:id` — detalle + documentos + historial de estado
- `POST /api/vehiculos` — alta
- `PUT /api/vehiculos/:id` — edición de estado (registra en `HistorialEstadoVehiculo` si cambia)
- `GET /api/vehiculos/vencimientos/proximos` — documentos por vencer

**Web** (`apps/web/src/pages/`):
- `VehiculosPage.tsx` — listado con badges de estado (`AUTORIZADO`, `EN_TALLER`, `PERMISO`, `DENEGADO`)
- `VencimientosPage.tsx`

**Stack:**
- API: Express + `mssql` (SQL Server) + JWT + express-validator + Winston
- Web: React 18 + Vite + TS + TanStack Query + Zustand + Tailwind + React Hook Form

## Qué falta (no existe todavía)

No hay ninguna tabla, ruta ni página que registre:
- Historial de mantenimientos realizados (service, reparación, cambio de repuestos)
- Costos asociados
- Kilometraje o fecha del próximo mantenimiento programado
- Taller / proveedor

## Preguntas a definir antes de programar

1. **Qué campos necesita el registro de mantenimiento:**
   tipo (preventivo/correctivo), fecha, km al momento, costo, taller/proveedor, repuestos usados, observaciones, ¿adjuntar comprobante/imagen (como ya existe en `ImagenVehiculo`)?
2. **¿Se define el "próximo mantenimiento" por km, por fecha, o ambos?**
   (afecta si hay que guardar `km_proximo_service` y/o `fecha_proximo_service` en el vehículo o en una tabla aparte)
3. **¿El mantenimiento dispara cambio de estado del vehículo?**
   Ej.: al crear un mantenimiento "en curso" → el vehículo pasa a `EN_TALLER` automáticamente (integrando con `HistorialEstadoVehiculo`), y al cerrarlo vuelve a `AUTORIZADO`.
4. **¿Quién puede cargar/editar mantenimientos?**
   (mismo patrón `authorize('ADMIN', 'OPERADOR')` que ya usan otras rutas, ¿o un rol nuevo tipo `MECANICO`?)
5. **¿Se necesita un dashboard/alerta de "vehículos con mantenimiento próximo"?**
   (mismo patrón que `vencimientos/proximos`, se podría llamar `mantenimientos/proximos`)

## Propuesta de pasos, una vez definido lo anterior

1. Migración SQL nueva: `database/06_mantenimiento.sql` con la tabla `flota.MantenimientoVehiculo` (y `flota.RepuestoMantenimiento` si se detalla por ítem).
2. `apps/api/src/routes/mantenimiento.routes.js` — CRUD + endpoint de próximos, siguiendo el mismo patrón que `vehiculo.routes.js`.
3. Registrar la ruta en `apps/api/src/index.js` (donde se montan los routers existentes).
4. `apps/web/src/pages/MantenimientoPage.tsx` (o pestaña dentro de `VehiculosPage.tsx`), reusando el patrón de tabla + TanStack Query.
5. Agregar la ruta en `App.tsx` y el link de navegación en `Layout.tsx`.
6. Si aplica el punto 3 de las preguntas abiertas: integrar la transición de estado con `HistorialEstadoVehiculo`.
