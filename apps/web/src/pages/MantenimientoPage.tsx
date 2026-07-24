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

const BADGE_ESTADO: Record<string, string> = {
  EN_CURSO: 'badge-yellow', FINALIZADO: 'badge-green',
};

// Las fechas son DATE puras (sin hora); formatear por texto evita que
// new Date(iso) las corra un día por conversión de timezone.
function formatFecha(iso: string) {
  const [y, m, d] = iso.slice(0, 10).split('-');
  return `${d}-${m}-${y}`;
}

export default function MantenimientoPage() {
  const [page, setPage] = useState(1);
  const queryClient = useQueryClient();

  const { data, isLoading } = useQuery({
    queryKey: ['mantenimientos', page],
    queryFn:  () => api.get(`/mantenimientos?page=${page}&pageSize=20`).then((r) => r.data),
  });

  async function finalizar(id: number) {
    const fechaProximo = window.prompt('Fecha del próximo mantenimiento (YYYY-MM-DD), opcional:');
    await api.put(`/mantenimientos/${id}/finalizar`, {
      fecha_fin: new Date().toISOString().slice(0, 10),
      fecha_proximo: fechaProximo || undefined,
    });
    queryClient.invalidateQueries({ queryKey: ['mantenimientos'] });
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Mantenimiento</h1>
          <p className="text-sm text-gray-500 mt-0.5">Historial de mantenimientos de la flota</p>
        </div>
        <span className="text-sm text-gray-400">{data?.total ?? '—'} registros</span>
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
                          <button onClick={() => finalizar(m.id_mantenimiento)} className="text-xs text-brand-600 hover:underline">
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
    </div>
  );
}
