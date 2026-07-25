import { useState } from 'react';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import api from '../lib/api';

interface Mantenimiento {
  id_mantenimiento: number; patente: string;
  tipo_mantenimiento: 'PREVENTIVO' | 'CORRECTIVO';
  estado: 'EN_CURSO' | 'FINALIZADO';
  fecha_inicio: string; fecha_fin: string | null; fecha_proximo: string | null;
  taller: string | null; costo: number | null;
}

interface Vehiculo { id_vehiculo: number; patente: string; }

const BADGE_ESTADO: Record<string, string> = {
  EN_CURSO: 'badge-yellow', FINALIZADO: 'badge-green',
};

const hoy = () => new Date().toISOString().slice(0, 10);

// Las fechas son DATE puras (sin hora); formatear por texto evita que
// new Date(iso) las corra un día por conversión de timezone.
function formatFecha(iso: string) {
  const [y, m, d] = iso.slice(0, 10).split('-');
  return `${d}-${m}-${y}`;
}

export default function MantenimientoPage() {
  const [page, setPage] = useState(1);
  const [showForm, setShowForm] = useState(false);
  const [finalizando, setFinalizando] = useState<Mantenimiento | null>(null);
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: ['mantenimientos', page],
    queryFn:  () => api.get(`/mantenimientos?page=${page}&pageSize=20`).then((r) => r.data),
  });

  function refrescar() {
    queryClient.invalidateQueries({ queryKey: ['mantenimientos'] });
    queryClient.invalidateQueries({ queryKey: ['vehiculos'] });
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Mantenimiento</h1>
          <p className="text-sm text-gray-500 mt-0.5">Historial de mantenimientos de la flota</p>
        </div>
        <div className="flex items-center gap-4">
          <span className="text-sm text-gray-400">{data?.total ?? '—'} registros</span>
          <button className="btn-primary" onClick={() => setShowForm(true)}>+ Nuevo mantenimiento</button>
        </div>
      </div>

      <div className="card">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-gray-200">
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Patente</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Tipo</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Estado</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Inicio</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Próximo</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Taller</th>
                <th className="py-3 px-2" />
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {isLoading
                ? [...Array(6)].map((_, i) => (
                    <tr key={i} className="animate-pulse">
                      {[...Array(7)].map((__, j) => (
                        <td key={j} className="py-3 px-2"><div className="h-4 bg-gray-200 rounded w-24" /></td>
                      ))}
                    </tr>
                  ))
                : data?.data.length === 0
                ? (
                    <tr><td colSpan={7} className="text-center py-12 text-gray-400">
                      Sin mantenimientos registrados
                    </td></tr>
                  )
                : data?.data.map((m: Mantenimiento) => (
                    <tr key={m.id_mantenimiento} className="hover:bg-gray-50 transition-colors">
                      <td className="py-3 px-2 font-mono font-semibold text-gray-900">{m.patente}</td>
                      <td className="py-3 px-2 text-gray-700">{m.tipo_mantenimiento}</td>
                      <td className="py-3 px-2"><span className={BADGE_ESTADO[m.estado]}>{m.estado}</span></td>
                      <td className="py-3 px-2 text-gray-600">{formatFecha(m.fecha_inicio)}</td>
                      <td className="py-3 px-2 text-gray-600">
                        {m.fecha_proximo ? formatFecha(m.fecha_proximo) : '—'}
                      </td>
                      <td className="py-3 px-2 text-gray-600">{m.taller ?? '—'}</td>
                      <td className="py-3 px-2 text-right">
                        {m.estado === 'EN_CURSO' && (
                          <button onClick={() => setFinalizando(m)} className="text-xs text-brand-600 hover:underline">
                            Finalizar
                          </button>
                        )}
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

      {showForm && <NuevoMantenimientoModal onClose={() => setShowForm(false)} onSaved={() => { setShowForm(false); refrescar(); }} />}
      {finalizando && <FinalizarModal mantenimiento={finalizando} onClose={() => setFinalizando(null)} onSaved={() => { setFinalizando(null); refrescar(); }} />}
    </div>
  );
}

function ModalShell({ title, children, onClose }: { title: string; children: React.ReactNode; onClose: () => void }) {
  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center z-50 p-4">
      <div className="card w-full max-w-md">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-bold text-gray-900">{title}</h2>
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 text-xl leading-none">&times;</button>
        </div>
        {children}
      </div>
    </div>
  );
}

function NuevoMantenimientoModal({ onClose, onSaved }: { onClose: () => void; onSaved: () => void }) {
  const [idVehiculo, setIdVehiculo] = useState('');
  const [tipo, setTipo] = useState<'PREVENTIVO' | 'CORRECTIVO'>('PREVENTIVO');
  const [fechaInicio, setFechaInicio] = useState(hoy());
  const [kmActual, setKmActual] = useState('');
  const [taller, setTaller] = useState('');
  const [descripcion, setDescripcion] = useState('');
  const [error, setError] = useState('');
  const [saving, setSaving] = useState(false);

  const { data: vehiculos } = useQuery({
    queryKey: ['vehiculos-select'],
    queryFn:  () => api.get('/vehiculos?activos=true&pageSize=200').then((r) => r.data.data as Vehiculo[]),
  });

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError('');
    setSaving(true);
    try {
      await api.post('/mantenimientos', {
        id_vehiculo: Number(idVehiculo),
        tipo_mantenimiento: tipo,
        fecha_inicio: fechaInicio,
        km_actual: kmActual ? Number(kmActual) : undefined,
        taller: taller || undefined,
        descripcion: descripcion || undefined,
      });
      onSaved();
    } catch (err: any) {
      setError(err.response?.data?.error ?? 'Error al crear el mantenimiento');
    } finally {
      setSaving(false);
    }
  }

  return (
    <ModalShell title="Nuevo mantenimiento" onClose={onClose}>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="label">Vehículo</label>
          <select className="input" value={idVehiculo} onChange={(e) => setIdVehiculo(e.target.value)} required>
            <option value="" disabled>Seleccionar patente</option>
            {vehiculos?.map((v) => (
              <option key={v.id_vehiculo} value={v.id_vehiculo}>{v.patente}</option>
            ))}
          </select>
        </div>

        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="label">Tipo</label>
            <select className="input" value={tipo} onChange={(e) => setTipo(e.target.value as any)}>
              <option value="PREVENTIVO">Preventivo</option>
              <option value="CORRECTIVO">Correctivo</option>
            </select>
          </div>
          <div>
            <label className="label">Fecha inicio</label>
            <input type="date" className="input" value={fechaInicio} onChange={(e) => setFechaInicio(e.target.value)} required />
          </div>
        </div>

        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="label">Km actual</label>
            <input type="number" min="0" className="input" value={kmActual} onChange={(e) => setKmActual(e.target.value)} />
          </div>
          <div>
            <label className="label">Taller</label>
            <input className="input" value={taller} onChange={(e) => setTaller(e.target.value)} />
          </div>
        </div>

        <div>
          <label className="label">Descripción / trabajo a realizar</label>
          <textarea className="input" rows={3} value={descripcion} onChange={(e) => setDescripcion(e.target.value)} />
        </div>

        {error && (
          <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-3 py-2">{error}</div>
        )}

        <div className="flex justify-end gap-2 pt-2">
          <button type="button" onClick={onClose} className="btn-secondary">Cancelar</button>
          <button type="submit" disabled={saving || !idVehiculo} className="btn-primary">
            {saving ? 'Guardando...' : 'Crear'}
          </button>
        </div>
      </form>
    </ModalShell>
  );
}

function FinalizarModal({ mantenimiento, onClose, onSaved }: { mantenimiento: Mantenimiento; onClose: () => void; onSaved: () => void }) {
  const [fechaFin, setFechaFin] = useState(hoy());
  const [fechaProximo, setFechaProximo] = useState('');
  const [costo, setCosto] = useState('');
  const [error, setError] = useState('');
  const [saving, setSaving] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError('');
    setSaving(true);
    try {
      await api.put(`/mantenimientos/${mantenimiento.id_mantenimiento}/finalizar`, {
        fecha_fin: fechaFin,
        fecha_proximo: fechaProximo || undefined,
        costo: costo ? Number(costo) : undefined,
      });
      onSaved();
    } catch (err: any) {
      setError(err.response?.data?.error ?? 'Error al finalizar el mantenimiento');
    } finally {
      setSaving(false);
    }
  }

  return (
    <ModalShell title={`Finalizar mantenimiento — ${mantenimiento.patente}`} onClose={onClose}>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="label">Fecha de fin</label>
          <input type="date" className="input" value={fechaFin} onChange={(e) => setFechaFin(e.target.value)} required />
        </div>
        <div>
          <label className="label">Próximo mantenimiento (opcional)</label>
          <input type="date" className="input" value={fechaProximo} onChange={(e) => setFechaProximo(e.target.value)} />
        </div>
        <div>
          <label className="label">Costo (opcional)</label>
          <input type="number" min="0" className="input" value={costo} onChange={(e) => setCosto(e.target.value)} />
        </div>

        {error && (
          <div className="bg-red-50 border border-red-200 text-red-700 text-sm rounded-lg px-3 py-2">{error}</div>
        )}

        <div className="flex justify-end gap-2 pt-2">
          <button type="button" onClick={onClose} className="btn-secondary">Cancelar</button>
          <button type="submit" disabled={saving} className="btn-primary">
            {saving ? 'Guardando...' : 'Finalizar'}
          </button>
        </div>
      </form>
    </ModalShell>
  );
}
