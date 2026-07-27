import { useState, useEffect } from 'react';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { useDebounce } from '../hooks/useDebounce';
import api from '../lib/api';
import { validarRut, formatearRut } from '../lib/rut';
import FileDropzone from '../components/FileDropzone';
import ModalShell, { FormSection } from '../components/ModalShell';

interface Conductor {
  id_conductor: number; rut: string; nombre: string; apellido_paterno: string;
  telefono: string; email: string; activo: boolean; vencimiento_licencia: string | null;
}

interface TipoLicencia { id_tipo_licencia: number; codigo: string; descripcion: string; ley_referencia: string | null; }

const hoy = () => new Date().toISOString().slice(0, 10);

export default function ConductoresPage() {
  const [busqueda, setBusqueda] = useState('');
  const [soloActivos, setSoloActivos] = useState(true);
  const [page, setPage] = useState(1);
  const [showForm, setShowForm] = useState(false);
  const [detalleId, setDetalleId] = useState<number | null>(null);
  const q = useDebounce(busqueda, 300);
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: ['conductores', q, soloActivos, page],
    queryFn:  () => api.get(`/conductores?q=${q}&activos=${soloActivos}&page=${page}&pageSize=20`).then((r) => r.data),
  });

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Conductores</h1>
          <p className="text-sm text-gray-500 mt-0.5">Personal registrado</p>
        </div>
        <button className="btn-primary" onClick={() => setShowForm(true)}>+ Nuevo conductor</button>
      </div>

      <div className="card">
        <div className="flex items-center gap-4 mb-4 flex-wrap">
          <input
            className="input max-w-xs"
            placeholder="Buscar por nombre o RUT…"
            value={busqueda}
            onChange={(e) => { setBusqueda(e.target.value); setPage(1); }}
          />
          <label className="flex items-center gap-2 text-sm text-gray-600 cursor-pointer">
            <input type="checkbox" checked={soloActivos}
              onChange={(e) => { setSoloActivos(e.target.checked); setPage(1); }}
              className="rounded border-gray-300" />
            Solo activos
          </label>
          <span className="text-sm text-gray-400 ml-auto">{data?.total ?? '—'} conductores</span>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-gray-200">
                <th className="text-left py-3 px-2 font-semibold text-gray-600">RUT</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Nombre</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Teléfono</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Venc. Licencia</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Estado</th>
                <th className="py-3 px-2" />
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {isLoading
                ? [...Array(8)].map((_, i) => (
                    <tr key={i} className="animate-pulse">
                      {[...Array(6)].map((__, j) => (
                        <td key={j} className="py-3 px-2"><div className="h-4 bg-gray-200 rounded w-24" /></td>
                      ))}
                    </tr>
                  ))
                : data?.data.map((c: Conductor) => (
                    <tr key={c.id_conductor} className="hover:bg-gray-50 transition-colors">
                      <td className="py-3 px-2 font-mono text-gray-700">{c.rut}</td>
                      <td className="py-3 px-2 font-medium text-gray-900">{c.nombre} {c.apellido_paterno}</td>
                      <td className="py-3 px-2 text-gray-600">{c.telefono ?? '—'}</td>
                      <td className="py-3 px-2 text-xs text-gray-600">{c.vencimiento_licencia ?? '—'}</td>
                      <td className="py-3 px-2">
                        <span className={c.activo ? 'badge-green' : 'badge-gray'}>
                          {c.activo ? 'Activo' : 'Retirado'}
                        </span>
                      </td>
                      <td className="py-3 px-2 text-right">
                        <button onClick={() => setDetalleId(c.id_conductor)} className="text-brand-600 hover:text-brand-800 text-xs font-medium">
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
        <NuevoConductorModal
          onClose={() => setShowForm(false)}
          onSaved={() => {
            setShowForm(false);
            queryClient.invalidateQueries({ queryKey: ['conductores'] });
          }}
        />
      )}

      {detalleId !== null && (
        <DetalleConductorModal
          id={detalleId}
          onClose={() => setDetalleId(null)}
          onChanged={() => queryClient.invalidateQueries({ queryKey: ['conductores'] })}
        />
      )}
    </div>
  );
}

function NuevoConductorModal({ onClose, onSaved }: { onClose: () => void; onSaved: () => void }) {
  const [rut, setRut] = useState('');
  const [rutError, setRutError] = useState('');
  const [nombre, setNombre] = useState('');
  const [apellidoPaterno, setApellidoPaterno] = useState('');
  const [apellidoMaterno, setApellidoMaterno] = useState('');
  const [direccion, setDireccion] = useState('');
  const [telefono, setTelefono] = useState('');
  const [email, setEmail] = useState('');
  const [fechaIngreso, setFechaIngreso] = useState(hoy());
  const [observaciones, setObservaciones] = useState('');
  const [idTipoLicencia, setIdTipoLicencia] = useState('');
  const [numeroLicencia, setNumeroLicencia] = useState('');
  const [fechaEmisionLicencia, setFechaEmisionLicencia] = useState('');
  const [fechaVencimientoLicencia, setFechaVencimientoLicencia] = useState('');
  const [fotoConductor, setFotoConductor] = useState<File | null>(null);
  const [fotoConductorError, setFotoConductorError] = useState('');
  const [fotoLicencia, setFotoLicencia] = useState<File | null>(null);
  const [fotoLicenciaError, setFotoLicenciaError] = useState('');
  const [error, setError] = useState('');
  const [saving, setSaving] = useState(false);

  const { data: tiposLicencia } = useQuery({
    queryKey: ['tipos-licencia'],
    queryFn:  () => api.get('/config/tipos-licencia').then((r) => r.data as TipoLicencia[]),
  });

  async function subirFoto(idConductor: number, tipo: 'FOTO_CONDUCTOR' | 'FOTO_LICENCIA', file: File) {
    const form = new FormData();
    form.append('tipo', tipo);
    form.append('imagen', file);
    await api.post(`/conductores/${idConductor}/imagen`, form);
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError('');

    if (!validarRut(rut)) {
      setRutError('RUT inválido');
      return;
    }

    setSaving(true);
    try {
      const { data } = await api.post('/conductores', {
        rut: formatearRut(rut),
        nombre,
        apellido_paterno: apellidoPaterno || undefined,
        apellido_materno: apellidoMaterno || undefined,
        direccion: direccion || undefined,
        telefono: telefono || undefined,
        email: email || undefined,
        fecha_ingreso: fechaIngreso || undefined,
        observaciones: observaciones || undefined,
        id_tipo_licencia: idTipoLicencia ? Number(idTipoLicencia) : undefined,
        numero_licencia: numeroLicencia || undefined,
        fecha_emision_licencia: fechaEmisionLicencia || undefined,
        fecha_vencimiento_licencia: fechaVencimientoLicencia || undefined,
      });

      if (fotoConductor) await subirFoto(data.id_conductor, 'FOTO_CONDUCTOR', fotoConductor);
      if (fotoLicencia) await subirFoto(data.id_conductor, 'FOTO_LICENCIA', fotoLicencia);

      onSaved();
    } catch (err: any) {
      setError(err.response?.data?.error ?? 'Error al crear el conductor');
    } finally {
      setSaving(false);
    }
  }

  return (
    <ModalShell title="Nuevo conductor" onClose={onClose} maxWidth="max-w-2xl">
      <form onSubmit={handleSubmit} className="space-y-6">
        <FormSection title="Datos personales">
          <div className="grid grid-cols-2 gap-x-4 gap-y-5">
            <div>
              <label className="label">RUT</label>
              <input
                className="input"
                value={rut}
                onChange={(e) => { setRut(e.target.value); setRutError(''); }}
                onBlur={() => {
                  if (!rut) return;
                  if (!validarRut(rut)) setRutError('RUT inválido');
                  else setRut(formatearRut(rut));
                }}
                placeholder="12345678-9"
                maxLength={12}
                required
              />
              {rutError && <p className="text-xs text-red-600 mt-1">{rutError}</p>}
            </div>
            <div>
              <label className="label">Nombre</label>
              <input className="input" value={nombre} onChange={(e) => setNombre(e.target.value)} maxLength={150} required />
            </div>
            <div>
              <label className="label">Apellido paterno</label>
              <input className="input" value={apellidoPaterno} onChange={(e) => setApellidoPaterno(e.target.value)} maxLength={100} />
            </div>
            <div>
              <label className="label">Apellido materno</label>
              <input className="input" value={apellidoMaterno} onChange={(e) => setApellidoMaterno(e.target.value)} maxLength={100} />
            </div>
            <div>
              <label className="label">Teléfono</label>
              <input className="input" value={telefono} onChange={(e) => setTelefono(e.target.value)} maxLength={20} />
            </div>
            <div>
              <label className="label">Email</label>
              <input type="email" className="input" value={email} onChange={(e) => setEmail(e.target.value)} maxLength={150} />
            </div>
            <div>
              <label className="label">Fecha ingreso</label>
              <input type="date" className="input" value={fechaIngreso} onChange={(e) => setFechaIngreso(e.target.value)} />
            </div>
            <div className="col-span-2">
              <label className="label">Dirección</label>
              <input className="input" value={direccion} onChange={(e) => setDireccion(e.target.value)} maxLength={300} />
            </div>
            <div className="col-span-2">
              <label className="label">Observaciones</label>
              <textarea className="input" rows={2} value={observaciones} onChange={(e) => setObservaciones(e.target.value)} maxLength={500} />
            </div>
            <div className="col-span-2">
              <FileDropzone
                label="Foto del conductor"
                accept="image/*"
                icon="🧑"
                hint="JPG, PNG, WEBP o GIF, hasta 5 MB"
                file={fotoConductor}
                error={fotoConductorError}
                onFile={(file) => {
                  if (file && !file.type.startsWith('image/')) {
                    setFotoConductorError('El archivo debe ser una imagen');
                    setFotoConductor(null);
                    return;
                  }
                  setFotoConductorError('');
                  setFotoConductor(file);
                }}
              />
            </div>
          </div>
        </FormSection>

        <FormSection title="Licencia (opcional)">
          <div className="grid grid-cols-2 gap-x-4 gap-y-5">
            <div>
              <label className="label">Tipo</label>
              <select className="input" value={idTipoLicencia} onChange={(e) => setIdTipoLicencia(e.target.value)}>
                <option value="">Sin especificar</option>
                {tiposLicencia?.map((t) => (
                  <option key={t.id_tipo_licencia} value={t.id_tipo_licencia}>{t.codigo} — {t.descripcion}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="label">Número</label>
              <input className="input" value={numeroLicencia} onChange={(e) => setNumeroLicencia(e.target.value)} maxLength={50} />
            </div>
            <div>
              <label className="label">Fecha emisión</label>
              <input type="date" className="input" value={fechaEmisionLicencia} onChange={(e) => setFechaEmisionLicencia(e.target.value)} />
            </div>
            <div>
              <label className="label">Fecha vencimiento</label>
              <input type="date" className="input" value={fechaVencimientoLicencia} onChange={(e) => setFechaVencimientoLicencia(e.target.value)} />
            </div>
            <div className="col-span-2">
              <FileDropzone
                label="Foto de la licencia"
                accept="image/*"
                icon="🪪"
                hint="JPG, PNG, WEBP o GIF, hasta 5 MB"
                file={fotoLicencia}
                error={fotoLicenciaError}
                onFile={(file) => {
                  if (file && !file.type.startsWith('image/')) {
                    setFotoLicenciaError('El archivo debe ser una imagen');
                    setFotoLicencia(null);
                    return;
                  }
                  setFotoLicenciaError('');
                  setFotoLicencia(file);
                }}
              />
            </div>
          </div>
        </FormSection>

        {error && (
          <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-3 py-2">{error}</div>
        )}

        <div className="flex justify-end gap-2 pt-2">
          <button type="button" onClick={onClose} className="btn-secondary">Cancelar</button>
          <button
            type="submit"
            disabled={saving || !rut || !nombre || !!rutError || !!fotoConductorError || !!fotoLicenciaError}
            className="btn-primary"
          >
            {saving ? 'Guardando...' : 'Crear'}
          </button>
        </div>
      </form>
    </ModalShell>
  );
}

interface Licencia {
  id_licencia: number; tipo_codigo: string; tipo_desc: string;
  numero_licencia: string | null; fecha_vencimiento: string; activa: boolean;
}
interface VehiculoAsignado { id_asignacion: number; patente: string; fecha_desde: string; fecha_hasta: string | null; es_titular: boolean; }
interface VehiculoOption { id_vehiculo: number; patente: string; }
interface ConductorDetalle {
  id_conductor: number; rut: string; nombre: string; apellido_paterno: string | null; apellido_materno: string | null;
  direccion: string | null; telefono: string | null; email: string | null;
  fecha_ingreso: string | null; fecha_retiro: string | null; observaciones: string | null; activo: boolean;
  licencias: Licencia[]; vehiculos: VehiculoAsignado[];
  foto_conductor: { id_imagen: number; fecha_subida: string } | null;
  foto_licencia: { id_imagen: number; fecha_subida: string } | null;
}

function DetalleConductorModal({ id, onClose, onChanged }: { id: number; onClose: () => void; onChanged: () => void }) {
  const [subiendoFotoConductor, setSubiendoFotoConductor] = useState(false);
  const [subiendoFotoLicencia, setSubiendoFotoLicencia] = useState(false);
  const [fotoConductorError, setFotoConductorError] = useState('');
  const [fotoLicenciaError, setFotoLicenciaError] = useState('');
  const [fotoConductorUrl, setFotoConductorUrl] = useState<string | null>(null);
  const [fotoLicenciaUrl, setFotoLicenciaUrl] = useState<string | null>(null);

  const [editando, setEditando] = useState(false);
  const [editNombre, setEditNombre] = useState('');
  const [editApellidoPaterno, setEditApellidoPaterno] = useState('');
  const [editApellidoMaterno, setEditApellidoMaterno] = useState('');
  const [editTelefono, setEditTelefono] = useState('');
  const [editEmail, setEditEmail] = useState('');
  const [editDireccion, setEditDireccion] = useState('');
  const [editObservaciones, setEditObservaciones] = useState('');
  const [guardandoEdicion, setGuardandoEdicion] = useState(false);
  const [editError, setEditError] = useState('');

  const [mostrarRetiro, setMostrarRetiro] = useState(false);
  const [motivoRetiro, setMotivoRetiro] = useState('');
  const [procesandoRetiro, setProcesandoRetiro] = useState(false);
  const [retiroError, setRetiroError] = useState('');

  const [mostrarConfirmEliminar, setMostrarConfirmEliminar] = useState(false);
  const [eliminando, setEliminando] = useState(false);
  const [eliminarError, setEliminarError] = useState('');

  const [mostrarAsignacion, setMostrarAsignacion] = useState(false);
  const [idVehiculoAsignar, setIdVehiculoAsignar] = useState('');
  const [fechaDesdeAsignar, setFechaDesdeAsignar] = useState(hoy());
  const [asignando, setAsignando] = useState(false);
  const [asignacionError, setAsignacionError] = useState('');
  const [finalizandoAsignacion, setFinalizandoAsignacion] = useState(false);

  const queryClient = useQueryClient();

  const { data: vehiculosDisponibles } = useQuery({
    queryKey: ['vehiculos-para-asignar'],
    queryFn:  () => api.get('/vehiculos?activos=true&pageSize=200').then((r) => r.data.data as VehiculoOption[]),
    enabled: mostrarAsignacion,
  });

  const { data: conductor, isLoading } = useQuery({
    queryKey: ['conductor-detalle', id],
    queryFn:  () => api.get(`/conductores/${id}`).then((r) => r.data as ConductorDetalle),
  });

  function iniciarEdicion() {
    if (!conductor) return;
    setEditNombre(conductor.nombre);
    setEditApellidoPaterno(conductor.apellido_paterno ?? '');
    setEditApellidoMaterno(conductor.apellido_materno ?? '');
    setEditTelefono(conductor.telefono ?? '');
    setEditEmail(conductor.email ?? '');
    setEditDireccion(conductor.direccion ?? '');
    setEditObservaciones(conductor.observaciones ?? '');
    setEditError('');
    setEditando(true);
  }

  async function handleGuardarEdicion(e: React.FormEvent) {
    e.preventDefault();
    setEditError('');
    setGuardandoEdicion(true);
    try {
      await api.put(`/conductores/${id}`, {
        nombre: editNombre,
        apellido_paterno: editApellidoPaterno || undefined,
        apellido_materno: editApellidoMaterno || undefined,
        telefono: editTelefono || undefined,
        email: editEmail || undefined,
        direccion: editDireccion || undefined,
        observaciones: editObservaciones || undefined,
      });
      setEditando(false);
      queryClient.invalidateQueries({ queryKey: ['conductor-detalle', id] });
      onChanged();
    } catch (err: any) {
      setEditError(err.response?.data?.error ?? 'Error al guardar los cambios');
    } finally {
      setGuardandoEdicion(false);
    }
  }

  async function handleRetirar() {
    setRetiroError('');
    setProcesandoRetiro(true);
    try {
      await api.post(`/conductores/${id}/retirar`, { obs_retiro: motivoRetiro || undefined });
      setMostrarRetiro(false);
      setMotivoRetiro('');
      queryClient.invalidateQueries({ queryKey: ['conductor-detalle', id] });
      onChanged();
    } catch (err: any) {
      setRetiroError(err.response?.data?.error ?? 'Error al retirar al conductor');
    } finally {
      setProcesandoRetiro(false);
    }
  }

  async function handleReactivar() {
    setRetiroError('');
    setProcesandoRetiro(true);
    try {
      await api.post(`/conductores/${id}/reactivar`);
      queryClient.invalidateQueries({ queryKey: ['conductor-detalle', id] });
      onChanged();
    } catch (err: any) {
      setRetiroError(err.response?.data?.error ?? 'Error al reactivar al conductor');
    } finally {
      setProcesandoRetiro(false);
    }
  }

  async function handleEliminar() {
    setEliminarError('');
    setEliminando(true);
    try {
      await api.delete(`/conductores/${id}`);
      onChanged();
      onClose();
    } catch (err: any) {
      setEliminarError(err.response?.data?.error ?? 'Error al eliminar el conductor');
      setEliminando(false);
    }
  }

  async function handleAsignarVehiculo() {
    setAsignacionError('');
    setAsignando(true);
    try {
      await api.post(`/conductores/${id}/asignacion`, {
        id_vehiculo: Number(idVehiculoAsignar),
        fecha_desde: fechaDesdeAsignar,
      });
      setMostrarAsignacion(false);
      setIdVehiculoAsignar('');
      queryClient.invalidateQueries({ queryKey: ['conductor-detalle', id] });
      onChanged();
    } catch (err: any) {
      setAsignacionError(err.response?.data?.error ?? 'Error al asignar el vehículo');
    } finally {
      setAsignando(false);
    }
  }

  async function handleFinalizarAsignacion() {
    setAsignacionError('');
    setFinalizandoAsignacion(true);
    try {
      await api.post(`/conductores/${id}/asignacion/finalizar`);
      queryClient.invalidateQueries({ queryKey: ['conductor-detalle', id] });
      onChanged();
    } catch (err: any) {
      setAsignacionError(err.response?.data?.error ?? 'Error al quitar la asignación');
    } finally {
      setFinalizandoAsignacion(false);
    }
  }

  useEffect(() => {
    if (!conductor?.foto_conductor) { setFotoConductorUrl(null); return; }
    let objectUrl: string | null = null;
    api.get(`/conductores/${id}/imagen?tipo=FOTO_CONDUCTOR`, { responseType: 'blob' }).then((res) => {
      objectUrl = URL.createObjectURL(res.data);
      setFotoConductorUrl(objectUrl);
    });
    return () => { if (objectUrl) URL.revokeObjectURL(objectUrl); };
  }, [id, conductor?.foto_conductor?.id_imagen]);

  useEffect(() => {
    if (!conductor?.foto_licencia) { setFotoLicenciaUrl(null); return; }
    let objectUrl: string | null = null;
    api.get(`/conductores/${id}/imagen?tipo=FOTO_LICENCIA`, { responseType: 'blob' }).then((res) => {
      objectUrl = URL.createObjectURL(res.data);
      setFotoLicenciaUrl(objectUrl);
    });
    return () => { if (objectUrl) URL.revokeObjectURL(objectUrl); };
  }, [id, conductor?.foto_licencia?.id_imagen]);

  async function handleSubirFoto(tipo: 'FOTO_CONDUCTOR' | 'FOTO_LICENCIA', e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    e.target.value = '';
    if (!file) return;
    if (!file.type.startsWith('image/')) {
      (tipo === 'FOTO_CONDUCTOR' ? setFotoConductorError : setFotoLicenciaError)('El archivo debe ser una imagen');
      return;
    }
    (tipo === 'FOTO_CONDUCTOR' ? setFotoConductorError : setFotoLicenciaError)('');
    (tipo === 'FOTO_CONDUCTOR' ? setSubiendoFotoConductor : setSubiendoFotoLicencia)(true);
    try {
      const form = new FormData();
      form.append('tipo', tipo);
      form.append('imagen', file);
      await api.post(`/conductores/${id}/imagen`, form);
      queryClient.invalidateQueries({ queryKey: ['conductor-detalle', id] });
    } catch (err: any) {
      (tipo === 'FOTO_CONDUCTOR' ? setFotoConductorError : setFotoLicenciaError)(err.response?.data?.error ?? 'Error al subir la imagen');
    } finally {
      (tipo === 'FOTO_CONDUCTOR' ? setSubiendoFotoConductor : setSubiendoFotoLicencia)(false);
    }
  }

  return (
    <ModalShell title={conductor ? `Conductor — ${conductor.nombre}` : 'Conductor'} onClose={onClose} maxWidth="max-w-2xl">
      {isLoading || !conductor ? (
        <p className="text-sm text-gray-400 py-8 text-center">Cargando...</p>
      ) : (
        <div className="space-y-5">
          <FormSection title="Datos personales">
            {editando ? (
              <form onSubmit={handleGuardarEdicion} className="space-y-4">
                <div className="grid grid-cols-2 gap-x-4 gap-y-4 text-sm">
                  <div>
                    <label className="label">Nombre</label>
                    <input className="input" value={editNombre} onChange={(e) => setEditNombre(e.target.value)} maxLength={150} required />
                  </div>
                  <div>
                    <label className="label">Apellido paterno</label>
                    <input className="input" value={editApellidoPaterno} onChange={(e) => setEditApellidoPaterno(e.target.value)} maxLength={100} />
                  </div>
                  <div>
                    <label className="label">Apellido materno</label>
                    <input className="input" value={editApellidoMaterno} onChange={(e) => setEditApellidoMaterno(e.target.value)} maxLength={100} />
                  </div>
                  <div>
                    <label className="label">Teléfono</label>
                    <input className="input" value={editTelefono} onChange={(e) => setEditTelefono(e.target.value)} maxLength={20} />
                  </div>
                  <div>
                    <label className="label">Email</label>
                    <input type="email" className="input" value={editEmail} onChange={(e) => setEditEmail(e.target.value)} maxLength={150} />
                  </div>
                  <div className="col-span-2">
                    <label className="label">Dirección</label>
                    <input className="input" value={editDireccion} onChange={(e) => setEditDireccion(e.target.value)} maxLength={300} />
                  </div>
                  <div className="col-span-2">
                    <label className="label">Observaciones</label>
                    <textarea className="input" rows={2} value={editObservaciones} onChange={(e) => setEditObservaciones(e.target.value)} maxLength={500} />
                  </div>
                </div>
                {editError && <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-3 py-2">{editError}</div>}
                <div className="flex justify-end gap-2">
                  <button type="button" className="btn-secondary text-xs" onClick={() => setEditando(false)}>Cancelar</button>
                  <button type="submit" disabled={guardandoEdicion || !editNombre} className="btn-primary text-xs">
                    {guardandoEdicion ? 'Guardando...' : 'Guardar cambios'}
                  </button>
                </div>
              </form>
            ) : (
              <div className="grid grid-cols-2 gap-4 text-sm">
                <div><span className="text-gray-400">RUT</span><br />{conductor.rut}</div>
                <div><span className="text-gray-400">Estado</span><br />
                  <span className={conductor.activo ? 'badge-green' : 'badge-gray'}>{conductor.activo ? 'Activo' : 'Retirado'}</span>
                </div>
                <div><span className="text-gray-400">Nombre completo</span><br />
                  {conductor.nombre} {conductor.apellido_paterno} {conductor.apellido_materno}
                </div>
                <div><span className="text-gray-400">Teléfono</span><br />{conductor.telefono ?? '—'}</div>
                <div><span className="text-gray-400">Email</span><br />{conductor.email ?? '—'}</div>
                <div><span className="text-gray-400">Fecha ingreso</span><br />
                  {conductor.fecha_ingreso ? new Date(conductor.fecha_ingreso).toLocaleDateString('es-CL') : '—'}
                </div>
                <div className="col-span-2"><span className="text-gray-400">Dirección</span><br />{conductor.direccion ?? '—'}</div>
                {conductor.observaciones && (
                  <div className="col-span-2"><span className="text-gray-400">Observaciones</span><br />{conductor.observaciones}</div>
                )}
                <div className="col-span-2">
                  <span className="text-gray-400">Foto del conductor</span><br />
                  {fotoConductorUrl ? (
                    <img src={fotoConductorUrl} alt={`Foto de ${conductor.nombre}`} className="mt-1 max-h-40 rounded-lg border border-gray-200" />
                  ) : (
                    <span className="text-gray-500 text-xs">Sin foto cargada</span>
                  )}
                  <label className="block mt-1 text-xs text-brand-600 hover:text-brand-800 cursor-pointer font-medium">
                    {subiendoFotoConductor ? 'Subiendo...' : conductor.foto_conductor ? 'Reemplazar foto' : 'Subir foto'}
                    <input type="file" accept="image/*" className="hidden" disabled={subiendoFotoConductor} onChange={(e) => handleSubirFoto('FOTO_CONDUCTOR', e)} />
                  </label>
                  {fotoConductorError && <p className="text-xs text-red-600 mt-1">{fotoConductorError}</p>}
                </div>
                <div className="col-span-2">
                  <button type="button" className="btn-secondary text-xs" onClick={iniciarEdicion}>Editar datos</button>
                </div>
              </div>
            )}
          </FormSection>

          <FormSection title="Licencia">
            {conductor.licencias.length === 0 ? (
              <p className="text-sm text-gray-400">Sin licencias registradas</p>
            ) : (
              <div className="space-y-2 text-sm">
                {conductor.licencias.map((l) => (
                  <div key={l.id_licencia} className="flex items-center justify-between">
                    <span className="text-gray-600">{l.tipo_codigo} — {l.tipo_desc}{l.numero_licencia ? ` (N° ${l.numero_licencia})` : ''}</span>
                    <span className="font-medium text-gray-900">{new Date(l.fecha_vencimiento).toLocaleDateString('es-CL')}</span>
                  </div>
                ))}
              </div>
            )}
            <div>
              <span className="text-gray-400 text-sm">Foto de la licencia</span><br />
              {fotoLicenciaUrl ? (
                <img src={fotoLicenciaUrl} alt="Foto de la licencia" className="mt-1 max-h-40 rounded-lg border border-gray-200" />
              ) : (
                <span className="text-gray-500 text-xs">Sin foto cargada</span>
              )}
              <label className="block mt-1 text-xs text-brand-600 hover:text-brand-800 cursor-pointer font-medium">
                {subiendoFotoLicencia ? 'Subiendo...' : conductor.foto_licencia ? 'Reemplazar foto' : 'Subir foto'}
                <input type="file" accept="image/*" className="hidden" disabled={subiendoFotoLicencia} onChange={(e) => handleSubirFoto('FOTO_LICENCIA', e)} />
              </label>
              {fotoLicenciaError && <p className="text-xs text-red-600 mt-1">{fotoLicenciaError}</p>}
            </div>
          </FormSection>

          <FormSection title="Vehículos asignados">
            {(() => {
              const activa = conductor.vehiculos.find((v) => !v.fecha_hasta);
              return (
                <div className="flex items-center justify-between text-sm bg-white border border-gray-200 rounded-lg px-3 py-2">
                  {activa ? (
                    <>
                      <div>
                        <span className="text-gray-400 text-xs">Vehículo actual</span><br />
                        <span className="font-mono font-semibold text-gray-900">{activa.patente}</span>
                        <span className="text-gray-400 text-xs ml-2">desde {new Date(activa.fecha_desde).toLocaleDateString('es-CL')}</span>
                      </div>
                      <div className="flex gap-3">
                        <button type="button" className="text-brand-600 hover:text-brand-800 text-xs font-medium" onClick={() => setMostrarAsignacion(true)}>
                          Cambiar vehículo
                        </button>
                        <button type="button" disabled={finalizandoAsignacion} className="text-red-600 hover:text-red-800 text-xs font-medium" onClick={handleFinalizarAsignacion}>
                          {finalizandoAsignacion ? 'Quitando...' : 'Quitar asignación'}
                        </button>
                      </div>
                    </>
                  ) : (
                    <>
                      <span className="text-gray-400">Sin vehículo asignado</span>
                      <button type="button" className="btn-secondary text-xs" onClick={() => setMostrarAsignacion(true)}>Asignar vehículo</button>
                    </>
                  )}
                </div>
              );
            })()}

            {mostrarAsignacion && (
              <div className="space-y-3 bg-gray-50 border border-gray-200 rounded-lg p-3">
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="label">Vehículo</label>
                    <select className="input" value={idVehiculoAsignar} onChange={(e) => setIdVehiculoAsignar(e.target.value)} required>
                      <option value="" disabled>Seleccionar</option>
                      {vehiculosDisponibles?.map((v) => (
                        <option key={v.id_vehiculo} value={v.id_vehiculo}>{v.patente}</option>
                      ))}
                    </select>
                  </div>
                  <div>
                    <label className="label">Desde</label>
                    <input type="date" className="input" value={fechaDesdeAsignar} onChange={(e) => setFechaDesdeAsignar(e.target.value)} required />
                  </div>
                </div>
                {asignacionError && <p className="text-xs text-red-600">{asignacionError}</p>}
                <div className="flex justify-end gap-2">
                  <button type="button" className="btn-secondary text-xs" onClick={() => { setMostrarAsignacion(false); setIdVehiculoAsignar(''); }}>Cancelar</button>
                  <button type="button" disabled={asignando || !idVehiculoAsignar} onClick={handleAsignarVehiculo} className="btn-primary text-xs">
                    {asignando ? 'Asignando...' : 'Confirmar asignación'}
                  </button>
                </div>
              </div>
            )}

            {conductor.vehiculos.length > 0 && (
              <div className="space-y-2 text-sm pt-1">
                <p className="text-xs font-semibold text-gray-400 uppercase tracking-wide">Historial</p>
                {conductor.vehiculos.map((v) => (
                  <div key={v.id_asignacion} className="flex items-center justify-between">
                    <span className="font-mono font-medium text-gray-900">{v.patente}</span>
                    <span className="text-gray-500 text-xs">
                      {new Date(v.fecha_desde).toLocaleDateString('es-CL')}
                      {v.fecha_hasta ? ` → ${new Date(v.fecha_hasta).toLocaleDateString('es-CL')}` : ' → actualidad'}
                    </span>
                  </div>
                ))}
              </div>
            )}
          </FormSection>

          <FormSection title="Baja del conductor">
            {mostrarRetiro ? (
              <div className="space-y-3">
                <div>
                  <label className="label">Motivo (opcional)</label>
                  <input className="input" value={motivoRetiro} onChange={(e) => setMotivoRetiro(e.target.value)} maxLength={500} />
                </div>
                {retiroError && <p className="text-xs text-red-600">{retiroError}</p>}
                <div className="flex justify-end gap-2">
                  <button type="button" className="btn-secondary text-xs" onClick={() => { setMostrarRetiro(false); setMotivoRetiro(''); }}>Cancelar</button>
                  <button type="button" disabled={procesandoRetiro} onClick={handleRetirar} className="btn-danger text-xs">
                    {procesandoRetiro ? 'Retirando...' : 'Confirmar retiro'}
                  </button>
                </div>
              </div>
            ) : (
              <div className="flex items-center justify-between">
                <p className="text-xs text-gray-500">
                  {conductor.activo
                    ? 'Marca al conductor como retirado. Es reversible: podés reactivarlo cuando quieras.'
                    : 'El conductor está retirado. Podés reactivarlo para que vuelva a estar disponible.'}
                </p>
                {conductor.activo ? (
                  <button type="button" className="btn-secondary text-xs shrink-0 ml-3" onClick={() => setMostrarRetiro(true)}>Retirar</button>
                ) : (
                  <button type="button" disabled={procesandoRetiro} className="btn-secondary text-xs shrink-0 ml-3" onClick={handleReactivar}>
                    {procesandoRetiro ? 'Reactivando...' : 'Reactivar'}
                  </button>
                )}
              </div>
            )}
            {!mostrarRetiro && retiroError && <p className="text-xs text-red-600 mt-2">{retiroError}</p>}

            <div className="border-t border-gray-200 mt-4 pt-4">
              {mostrarConfirmEliminar ? (
                <div className="space-y-2">
                  <p className="text-xs text-red-700 bg-red-50 border border-red-200 rounded-lg px-3 py-2">
                    Esta acción no se puede deshacer: se borrará el conductor junto con su historial de licencias y fotos.
                  </p>
                  {eliminarError && <p className="text-xs text-red-600">{eliminarError}</p>}
                  <div className="flex justify-end gap-2">
                    <button type="button" className="btn-secondary text-xs" onClick={() => setMostrarConfirmEliminar(false)}>Cancelar</button>
                    <button type="button" disabled={eliminando} onClick={handleEliminar} className="btn-danger text-xs">
                      {eliminando ? 'Eliminando...' : 'Sí, eliminar definitivamente'}
                    </button>
                  </div>
                </div>
              ) : (
                <div className="flex items-center justify-between">
                  <p className="text-xs text-gray-500">Elimina el registro por completo. Úsalo solo para datos cargados por error.</p>
                  <button type="button" className="text-xs text-red-600 hover:text-red-800 font-medium shrink-0 ml-3" onClick={() => setMostrarConfirmEliminar(true)}>
                    Eliminar definitivamente
                  </button>
                </div>
              )}
            </div>
          </FormSection>

          <div className="flex justify-end pt-2">
            <button type="button" onClick={onClose} className="btn-secondary">Cerrar</button>
          </div>
        </div>
      )}
    </ModalShell>
  );
}
