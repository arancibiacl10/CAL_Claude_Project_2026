import { useState, useEffect } from 'react';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import api from '../lib/api';
import { validarRut, formatearRut } from '../lib/rut';
import { validarPatente, formatearPatente } from '../lib/patente';

interface Vehiculo {
  id_vehiculo: number; patente: string; estado: string; estado_desc: string;
  fecha_ingreso: string; activo: boolean; proximo_vencimiento: string | null;
}

interface EstadoVehiculo { id_estado: number; codigo: string; descripcion: string; }

const BADGE: Record<string, string> = {
  AUTORIZADO: 'badge-green', EN_TALLER: 'badge-yellow',
  PERMISO: 'badge-blue', DENEGADO: 'badge-red',
};

const hoy = () => new Date().toISOString().slice(0, 10);

export default function VehiculosPage() {
  const [soloActivos, setSoloActivos] = useState(true);
  const [page, setPage] = useState(1);
  const [showForm, setShowForm] = useState(false);
  const [detalleId, setDetalleId] = useState<number | null>(null);
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: ['vehiculos', soloActivos, page],
    queryFn:  () => api.get(`/vehiculos?activos=${soloActivos}&page=${page}&pageSize=20`).then((r) => r.data),
  });

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Vehículos</h1>
          <p className="text-sm text-gray-500 mt-0.5">Flota registrada en el sistema</p>
        </div>
        <button className="btn-primary" onClick={() => setShowForm(true)}>+ Nuevo vehículo</button>
      </div>

      <div className="card">
        <div className="flex items-center gap-4 mb-4">
          <label className="flex items-center gap-2 text-sm text-gray-600 cursor-pointer">
            <input
              type="checkbox"
              checked={soloActivos}
              onChange={(e) => { setSoloActivos(e.target.checked); setPage(1); }}
              className="rounded border-gray-300"
            />
            Solo activos
          </label>
          <span className="text-sm text-gray-400 ml-auto">
            {data?.total ?? '—'} vehículos
          </span>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-gray-200">
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Patente</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Estado</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Ingreso</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Próx. Vencimiento</th>
                <th className="py-3 px-2" />
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {isLoading
                ? [...Array(8)].map((_, i) => (
                    <tr key={i} className="animate-pulse">
                      {[...Array(5)].map((__, j) => (
                        <td key={j} className="py-3 px-2"><div className="h-4 bg-gray-200 rounded w-24" /></td>
                      ))}
                    </tr>
                  ))
                : data?.data.map((v: Vehiculo) => (
                    <tr key={v.id_vehiculo} className="hover:bg-gray-50 transition-colors">
                      <td className="py-3 px-2 font-mono font-semibold text-gray-900">{v.patente}</td>
                      <td className="py-3 px-2">
                        <span className={BADGE[v.estado] ?? 'badge-gray'}>{v.estado_desc}</span>
                      </td>
                      <td className="py-3 px-2 text-gray-600">
                        {v.fecha_ingreso ? new Date(v.fecha_ingreso).toLocaleDateString('es-CL') : '—'}
                      </td>
                      <td className="py-3 px-2 text-gray-600 text-xs">
                        {v.proximo_vencimiento ?? <span className="text-green-600">Al día</span>}
                      </td>
                      <td className="py-3 px-2 text-right">
                        <button
                          onClick={() => setDetalleId(v.id_vehiculo)}
                          className="text-brand-600 hover:text-brand-800 text-xs font-medium"
                        >
                          Ver detalle
                        </button>
                      </td>
                    </tr>
                  ))}
            </tbody>
          </table>
        </div>

        {data && data.total > 20 && (
          <div className="flex justify-center gap-2 mt-4">
            <button disabled={page === 1} onClick={() => setPage(p => p - 1)} className="btn-secondary text-xs py-1">
              ← Anterior
            </button>
            <span className="text-sm text-gray-500 self-center">Pág. {page}</span>
            <button disabled={page * 20 >= data.total} onClick={() => setPage(p => p + 1)} className="btn-secondary text-xs py-1">
              Siguiente →
            </button>
          </div>
        )}
      </div>

      {showForm && (
        <NuevoVehiculoModal
          onClose={() => setShowForm(false)}
          onSaved={() => {
            setShowForm(false);
            queryClient.invalidateQueries({ queryKey: ['vehiculos'] });
          }}
        />
      )}

      {detalleId !== null && (
        <DetalleVehiculoModal
          id={detalleId}
          onClose={() => setDetalleId(null)}
          onChanged={() => queryClient.invalidateQueries({ queryKey: ['vehiculos'] })}
        />
      )}
    </div>
  );
}

function ModalShell({ title, children, onClose, maxWidth = 'max-w-md' }: { title: string; children: React.ReactNode; onClose: () => void; maxWidth?: string }) {
  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
      <div className={`card w-full ${maxWidth} max-h-[90vh] overflow-y-auto`}>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-bold text-gray-900">{title}</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>
        {children}
      </div>
    </div>
  );
}

function FormSection({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <div className="bg-gray-50 border border-gray-200 rounded-lg p-4">
      <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">{title}</p>
      <div className="space-y-4">{children}</div>
    </div>
  );
}

function NuevoVehiculoModal({ onClose, onSaved }: { onClose: () => void; onSaved: () => void }) {
  const [patente, setPatente] = useState('');
  const [patenteError, setPatenteError] = useState('');
  const [idEstado, setIdEstado] = useState('');
  const [fechaIngreso, setFechaIngreso] = useState(hoy());
  const [codigoLinea, setCodigoLinea] = useState('');
  const [contratoPdf, setContratoPdf] = useState<File | null>(null);
  const [contratoError, setContratoError] = useState('');
  const [imagenVehiculo, setImagenVehiculo] = useState<File | null>(null);
  const [imagenError, setImagenError] = useState('');
  const [rutPropietario, setRutPropietario] = useState('');
  const [rutError, setRutError] = useState('');
  const [nombrePropietario, setNombrePropietario] = useState('');
  const [direccionPropietario, setDireccionPropietario] = useState('');
  const [telefonoPropietario, setTelefonoPropietario] = useState('');
  const [emailPropietario, setEmailPropietario] = useState('');
  const [permisoCirculacion, setPermisoCirculacion] = useState('');
  const [seguroObligatorio, setSeguroObligatorio] = useState('');
  const [revisionTecnica, setRevisionTecnica] = useState('');
  const [observaciones, setObservaciones] = useState('');
  const [error, setError] = useState('');
  const [saving, setSaving] = useState(false);

  const { data: estados } = useQuery({
    queryKey: ['estados-vehiculo'],
    queryFn:  () => api.get('/config/estados-vehiculo').then((r) => r.data as EstadoVehiculo[]),
  });

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError('');

    if (!validarPatente(patente)) {
      setPatenteError('Patente inválida (formato esperado: LLLL-NN)');
      return;
    }
    if (rutPropietario && !validarRut(rutPropietario)) {
      setRutError('RUT inválido');
      return;
    }

    setSaving(true);
    try {
      const { data } = await api.post('/vehiculos', {
        patente: formatearPatente(patente),
        id_estado: Number(idEstado),
        fecha_ingreso: fechaIngreso,
        codigo_linea: codigoLinea || undefined,
        rut_propietario: rutPropietario ? formatearRut(rutPropietario) : undefined,
        nombre_propietario: nombrePropietario || undefined,
        direccion_propietario: direccionPropietario || undefined,
        telefono_propietario: telefonoPropietario || undefined,
        email_propietario: emailPropietario || undefined,
        permiso_circulacion: permisoCirculacion || undefined,
        seguro_obligatorio: seguroObligatorio || undefined,
        revision_tecnica: revisionTecnica || undefined,
        observaciones: observaciones || undefined,
      });

      if (contratoPdf) {
        const form = new FormData();
        form.append('contrato', contratoPdf);
        await api.post(`/vehiculos/${data.id_vehiculo}/contrato`, form);
      }
      if (imagenVehiculo) {
        const form = new FormData();
        form.append('imagen', imagenVehiculo);
        await api.post(`/vehiculos/${data.id_vehiculo}/imagen`, form);
      }

      onSaved();
    } catch (err: any) {
      setError(err.response?.data?.error ?? 'Error al crear el vehículo');
    } finally {
      setSaving(false);
    }
  }

  return (
    <ModalShell title="Nuevo vehículo" onClose={onClose} maxWidth="max-w-2xl">
      <form onSubmit={handleSubmit} className="space-y-5">
        <FormSection title="Datos del vehículo">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="label">Patente</label>
              <input
                className="input font-mono uppercase"
                value={patente}
                onChange={(e) => { setPatente(e.target.value); setPatenteError(''); }}
                onBlur={() => {
                  if (!patente) return;
                  if (!validarPatente(patente)) setPatenteError('Patente inválida (formato esperado: LLLL-NN)');
                  else setPatente(formatearPatente(patente));
                }}
                placeholder="BXSH-97"
                maxLength={10}
                required
              />
              {patenteError && <p className="text-xs text-red-600 mt-1">{patenteError}</p>}
            </div>
            <div>
              <label className="label">Código línea</label>
              <input className="input" value={codigoLinea} onChange={(e) => setCodigoLinea(e.target.value)} maxLength={20} />
            </div>
            <div>
              <label className="label">Estado</label>
              <select className="input" value={idEstado} onChange={(e) => setIdEstado(e.target.value)} required>
                <option value="" disabled>Seleccionar</option>
                {estados?.map((es) => (
                  <option key={es.id_estado} value={es.id_estado}>{es.descripcion}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="label">Fecha ingreso</label>
              <input type="date" className="input" value={fechaIngreso} onChange={(e) => setFechaIngreso(e.target.value)} required />
            </div>
            <div className="col-span-2">
              <label className="label">Contrato de servicio (PDF)</label>
              <input
                type="file"
                accept="application/pdf"
                className="input"
                onChange={(e) => {
                  const file = e.target.files?.[0] ?? null;
                  if (file && file.type !== 'application/pdf') {
                    setContratoError('El contrato debe ser un archivo PDF');
                    setContratoPdf(null);
                    e.target.value = '';
                    return;
                  }
                  setContratoError('');
                  setContratoPdf(file);
                }}
              />
              {contratoError && <p className="text-xs text-red-600 mt-1">{contratoError}</p>}
            </div>
            <div>
              <label className="label">Imagen del vehículo</label>
              <input
                type="file"
                accept="image/*"
                className="input"
                onChange={(e) => {
                  const file = e.target.files?.[0] ?? null;
                  if (file && !file.type.startsWith('image/')) {
                    setImagenError('El archivo debe ser una imagen');
                    setImagenVehiculo(null);
                    e.target.value = '';
                    return;
                  }
                  setImagenError('');
                  setImagenVehiculo(file);
                }}
              />
              {imagenError && <p className="text-xs text-red-600 mt-1">{imagenError}</p>}
            </div>
          </div>
        </FormSection>

        <FormSection title="Documentos">
          <div className="grid grid-cols-3 gap-4">
            <div>
              <label className="label">Permiso circulación</label>
              <input type="date" className="input" value={permisoCirculacion} onChange={(e) => setPermisoCirculacion(e.target.value)} />
            </div>
            <div>
              <label className="label">Seguro obligatorio</label>
              <input type="date" className="input" value={seguroObligatorio} onChange={(e) => setSeguroObligatorio(e.target.value)} />
            </div>
            <div>
              <label className="label">Revisión técnica</label>
              <input type="date" className="input" value={revisionTecnica} onChange={(e) => setRevisionTecnica(e.target.value)} />
            </div>
          </div>
          <div>
            <label className="label">Observaciones</label>
            <textarea className="input" rows={2} value={observaciones} onChange={(e) => setObservaciones(e.target.value)} maxLength={500} />
          </div>
        </FormSection>

        <FormSection title="Propietario">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="label">RUT</label>
              <input
                className="input"
                value={rutPropietario}
                onChange={(e) => { setRutPropietario(e.target.value); setRutError(''); }}
                onBlur={() => {
                  if (!rutPropietario) return;
                  if (!validarRut(rutPropietario)) setRutError('RUT inválido');
                  else setRutPropietario(formatearRut(rutPropietario));
                }}
                placeholder="12345678-9"
                maxLength={12}
              />
              {rutError && <p className="text-xs text-red-600 mt-1">{rutError}</p>}
            </div>
            <div>
              <label className="label">Teléfono</label>
              <input className="input" value={telefonoPropietario} onChange={(e) => setTelefonoPropietario(e.target.value)} maxLength={20} />
            </div>
            <div>
              <label className="label">Nombre</label>
              <input className="input" value={nombrePropietario} onChange={(e) => setNombrePropietario(e.target.value)} maxLength={150} />
            </div>
            <div>
              <label className="label">Email</label>
              <input type="email" className="input" value={emailPropietario} onChange={(e) => setEmailPropietario(e.target.value)} maxLength={150} />
            </div>
            <div className="col-span-2">
              <label className="label">Dirección</label>
              <input className="input" value={direccionPropietario} onChange={(e) => setDireccionPropietario(e.target.value)} maxLength={300} />
            </div>
          </div>
        </FormSection>

        {error && (
          <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-3 py-2">{error}</div>
        )}

        <div className="flex justify-end gap-2 pt-2">
          <button type="button" onClick={onClose} className="btn-secondary">Cancelar</button>
          <button type="submit" disabled={saving || !patente || !idEstado || !!rutError || !!patenteError || !!contratoError || !!imagenError} className="btn-primary">
            {saving ? 'Guardando...' : 'Crear'}
          </button>
        </div>
      </form>
    </ModalShell>
  );
}

interface DocumentoVehiculo {
  id_doc: number; tipo_documento: string; fecha_vencimiento: string;
}
interface HistorialEstado {
  id_historial: number; estado_nuevo_cod: string; fecha_cambio: string; motivo: string | null;
}
interface VehiculoDetalle {
  id_vehiculo: number; patente: string; id_estado: number; estado: string; estado_desc: string;
  fecha_ingreso: string; fecha_retiro: string | null; codigo_linea: string | null;
  contrato_servicio: string | null; observaciones: string | null;
  rut_propietario: string | null; nombre_propietario: string | null;
  direccion_propietario: string | null; telefono_propietario: string | null; email_propietario: string | null;
  documentos: DocumentoVehiculo[]; historial: HistorialEstado[];
  contrato_pdf: { id_imagen: number; fecha_subida: string } | null;
  imagen_vehiculo: { id_imagen: number; fecha_subida: string } | null;
}

const TIPO_DOC_LABEL: Record<string, string> = {
  PERMISO_CIRCULACION: 'Permiso circulación',
  SEGURO_OBLIGATORIO: 'Seguro obligatorio',
  REVISION_TECNICA: 'Revisión técnica',
};

function DetalleVehiculoModal({ id, onClose, onChanged }: { id: number; onClose: () => void; onChanged: () => void }) {
  const [nuevoEstado, setNuevoEstado] = useState('');
  const [motivo, setMotivo] = useState('');
  const [error, setError] = useState('');
  const [saving, setSaving] = useState(false);
  const [subiendoContrato, setSubiendoContrato] = useState(false);
  const [contratoError, setContratoError] = useState('');
  const [subiendoImagen, setSubiendoImagen] = useState(false);
  const [imagenError, setImagenError] = useState('');
  const [imagenUrl, setImagenUrl] = useState<string | null>(null);
  const queryClient = useQueryClient();

  async function handleVerContrato() {
    const res = await api.get(`/vehiculos/${id}/contrato`, { responseType: 'blob' });
    const url = URL.createObjectURL(res.data);
    window.open(url, '_blank');
  }

  async function handleSubirContrato(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    e.target.value = '';
    if (!file) return;
    if (file.type !== 'application/pdf') {
      setContratoError('El contrato debe ser un archivo PDF');
      return;
    }
    setContratoError('');
    setSubiendoContrato(true);
    try {
      const form = new FormData();
      form.append('contrato', file);
      await api.post(`/vehiculos/${id}/contrato`, form);
      queryClient.invalidateQueries({ queryKey: ['vehiculo-detalle', id] });
    } catch (err: any) {
      setContratoError(err.response?.data?.error ?? 'Error al subir el contrato');
    } finally {
      setSubiendoContrato(false);
    }
  }

  async function handleSubirImagen(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    e.target.value = '';
    if (!file) return;
    if (!file.type.startsWith('image/')) {
      setImagenError('El archivo debe ser una imagen');
      return;
    }
    setImagenError('');
    setSubiendoImagen(true);
    try {
      const form = new FormData();
      form.append('imagen', file);
      await api.post(`/vehiculos/${id}/imagen`, form);
      queryClient.invalidateQueries({ queryKey: ['vehiculo-detalle', id] });
    } catch (err: any) {
      setImagenError(err.response?.data?.error ?? 'Error al subir la imagen');
    } finally {
      setSubiendoImagen(false);
    }
  }

  const { data: vehiculo, isLoading } = useQuery({
    queryKey: ['vehiculo-detalle', id],
    queryFn:  () => api.get(`/vehiculos/${id}`).then((r) => r.data as VehiculoDetalle),
  });

  useEffect(() => {
    if (!vehiculo?.imagen_vehiculo) {
      setImagenUrl(null);
      return;
    }
    let objectUrl: string | null = null;
    api.get(`/vehiculos/${id}/imagen`, { responseType: 'blob' }).then((res) => {
      objectUrl = URL.createObjectURL(res.data);
      setImagenUrl(objectUrl);
    });
    return () => { if (objectUrl) URL.revokeObjectURL(objectUrl); };
  }, [id, vehiculo?.imagen_vehiculo?.id_imagen]);

  const { data: estados } = useQuery({
    queryKey: ['estados-vehiculo'],
    queryFn:  () => api.get('/config/estados-vehiculo').then((r) => r.data as EstadoVehiculo[]),
  });

  async function handleCambiarEstado(e: React.FormEvent) {
    e.preventDefault();
    setError('');
    setSaving(true);
    try {
      await api.put(`/vehiculos/${id}`, {
        id_estado: Number(nuevoEstado),
        motivo_estado: motivo || undefined,
      });
      setNuevoEstado('');
      setMotivo('');
      queryClient.invalidateQueries({ queryKey: ['vehiculo-detalle', id] });
      onChanged();
    } catch (err: any) {
      setError(err.response?.data?.error ?? 'Error al cambiar el estado');
    } finally {
      setSaving(false);
    }
  }

  return (
    <ModalShell title={vehiculo ? `Vehículo — ${vehiculo.patente}` : 'Vehículo'} onClose={onClose} maxWidth="max-w-2xl">
      {isLoading || !vehiculo ? (
        <p className="text-sm text-gray-400 py-8 text-center">Cargando...</p>
      ) : (
        <div className="space-y-5">
          <FormSection title="Datos del vehículo">
            <div className="grid grid-cols-2 gap-4 text-sm">
              <div><span className="text-gray-400">Estado</span><br /><span className={BADGE[vehiculo.estado] ?? 'badge-gray'}>{vehiculo.estado_desc}</span></div>
              <div><span className="text-gray-400">Código línea</span><br />{vehiculo.codigo_linea ?? '—'}</div>
              <div><span className="text-gray-400">Fecha ingreso</span><br />{new Date(vehiculo.fecha_ingreso).toLocaleDateString('es-CL')}</div>
              <div><span className="text-gray-400">Fecha retiro</span><br />{vehiculo.fecha_retiro ? new Date(vehiculo.fecha_retiro).toLocaleDateString('es-CL') : '—'}</div>
              <div className="col-span-2">
                <span className="text-gray-400">Contrato de servicio</span><br />
                {vehiculo.contrato_pdf ? (
                  <button type="button" onClick={handleVerContrato} className="text-brand-600 hover:text-brand-800 text-xs font-medium">
                    📄 Ver contrato (PDF)
                  </button>
                ) : (
                  <span className="text-gray-500 text-xs">{vehiculo.contrato_servicio ?? 'Sin contrato cargado'}</span>
                )}
                <label className="block mt-1 text-xs text-brand-600 hover:text-brand-800 cursor-pointer font-medium">
                  {subiendoContrato ? 'Subiendo...' : vehiculo.contrato_pdf ? 'Reemplazar PDF' : 'Subir contrato (PDF)'}
                  <input type="file" accept="application/pdf" className="hidden" disabled={subiendoContrato} onChange={handleSubirContrato} />
                </label>
                {contratoError && <p className="text-xs text-red-600 mt-1">{contratoError}</p>}
              </div>
              <div className="col-span-2">
                <span className="text-gray-400">Imagen del vehículo</span><br />
                {imagenUrl ? (
                  <img src={imagenUrl} alt={`Foto de ${vehiculo.patente}`} className="mt-1 max-h-40 rounded-lg border border-gray-200" />
                ) : (
                  <span className="text-gray-500 text-xs">Sin imagen cargada</span>
                )}
                <label className="block mt-1 text-xs text-brand-600 hover:text-brand-800 cursor-pointer font-medium">
                  {subiendoImagen ? 'Subiendo...' : vehiculo.imagen_vehiculo ? 'Reemplazar imagen' : 'Subir imagen'}
                  <input type="file" accept="image/*" className="hidden" disabled={subiendoImagen} onChange={handleSubirImagen} />
                </label>
                {imagenError && <p className="text-xs text-red-600 mt-1">{imagenError}</p>}
              </div>
              {vehiculo.observaciones && (
                <div className="col-span-2"><span className="text-gray-400">Observaciones</span><br />{vehiculo.observaciones}</div>
              )}
            </div>
          </FormSection>

          <FormSection title="Propietario">
            {vehiculo.rut_propietario ? (
              <div className="grid grid-cols-2 gap-4 text-sm">
                <div><span className="text-gray-400">RUT</span><br />{vehiculo.rut_propietario}</div>
                <div><span className="text-gray-400">Teléfono</span><br />{vehiculo.telefono_propietario ?? '—'}</div>
                <div><span className="text-gray-400">Nombre</span><br />{vehiculo.nombre_propietario}</div>
                <div><span className="text-gray-400">Email</span><br />{vehiculo.email_propietario ?? '—'}</div>
                <div className="col-span-2"><span className="text-gray-400">Dirección</span><br />{vehiculo.direccion_propietario ?? '—'}</div>
              </div>
            ) : (
              <p className="text-sm text-gray-400">Sin propietario registrado</p>
            )}
          </FormSection>

          <FormSection title="Documentos">
            {vehiculo.documentos.length === 0 ? (
              <p className="text-sm text-gray-400">Sin documentos registrados</p>
            ) : (
              <div className="space-y-2 text-sm">
                {vehiculo.documentos.map((d) => (
                  <div key={d.id_doc} className="flex items-center justify-between">
                    <span className="text-gray-600">{TIPO_DOC_LABEL[d.tipo_documento] ?? d.tipo_documento}</span>
                    <span className="font-medium text-gray-900">{new Date(d.fecha_vencimiento).toLocaleDateString('es-CL')}</span>
                  </div>
                ))}
              </div>
            )}
          </FormSection>

          {vehiculo.historial.length > 0 && (
            <FormSection title="Historial de estados">
              <div className="space-y-2 text-sm">
                {vehiculo.historial.map((h) => (
                  <div key={h.id_historial} className="flex items-center justify-between">
                    <span className="text-gray-600">
                      {new Date(h.fecha_cambio).toLocaleDateString('es-CL')} → <span className={BADGE[h.estado_nuevo_cod] ?? 'badge-gray'}>{h.estado_nuevo_cod}</span>
                    </span>
                    {h.motivo && <span className="text-gray-400 text-xs">{h.motivo}</span>}
                  </div>
                ))}
              </div>
            </FormSection>
          )}

          <FormSection title="Cambiar estado">
            <form onSubmit={handleCambiarEstado} className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="label">Nuevo estado</label>
                  <select className="input" value={nuevoEstado} onChange={(e) => setNuevoEstado(e.target.value)} required>
                    <option value="" disabled>Seleccionar</option>
                    {estados?.filter((es) => es.id_estado !== vehiculo.id_estado).map((es) => (
                      <option key={es.id_estado} value={es.id_estado}>{es.descripcion}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="label">Motivo (opcional)</label>
                  <input className="input" value={motivo} onChange={(e) => setMotivo(e.target.value)} maxLength={500} />
                </div>
              </div>
              {error && (
                <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-3 py-2">{error}</div>
              )}
              <div className="flex justify-end">
                <button type="submit" disabled={saving || !nuevoEstado} className="btn-primary">
                  {saving ? 'Guardando...' : 'Cambiar estado'}
                </button>
              </div>
            </form>
          </FormSection>

          <div className="flex justify-end pt-2">
            <button type="button" onClick={onClose} className="btn-secondary">Cerrar</button>
          </div>
        </div>
      )}
    </ModalShell>
  );
}
