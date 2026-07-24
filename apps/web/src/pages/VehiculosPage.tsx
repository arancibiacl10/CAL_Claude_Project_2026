import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../lib/api';

interface Vehiculo {
  id_vehiculo: number; patente: string; estado: string; estado_desc: string;
  fecha_ingreso: string; activo: boolean; proximo_vencimiento: string | null;
}

const BADGE: Record<string, string> = {
  AUTORIZADO: 'badge-green', EN_TALLER: 'badge-yellow',
  PERMISO: 'badge-blue', DENEGADO: 'badge-red',
};

export default function VehiculosPage() {
  const [soloActivos, setSoloActivos] = useState(true);
  const [page, setPage] = useState(1);

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
        <button className="btn-primary">+ Nuevo vehículo</button>
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
                        <button className="text-brand-600 hover:text-brand-800 text-xs font-medium">
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
    </div>
  );
}
