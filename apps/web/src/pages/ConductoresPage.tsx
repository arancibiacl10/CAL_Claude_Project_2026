import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import { useDebounce } from '../hooks/useDebounce';
import api from '../lib/api';

interface Conductor {
  id_conductor: number; rut: string; nombre: string; apellido_paterno: string;
  telefono: string; email: string; activo: boolean; vencimiento_licencia: string | null;
}

export default function ConductoresPage() {
  const [busqueda, setBusqueda] = useState('');
  const [soloActivos, setSoloActivos] = useState(true);
  const [page, setPage] = useState(1);
  const q = useDebounce(busqueda, 300);

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
        <button className="btn-primary">+ Nuevo conductor</button>
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
                        <button className="text-brand-600 hover:text-brand-800 text-xs font-medium">Ver detalle</button>
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
    </div>
  );
}
