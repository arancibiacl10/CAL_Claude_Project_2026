import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import { format } from 'date-fns';
import api from '../lib/api';

const ESTADO_BADGE: Record<string, string> = {
  PENDIENTE:  'badge-yellow',
  COMPLETADA: 'badge-green',
  ANULADA:    'badge-red',
};

export default function HojaRutaPage() {
  const [fecha, setFecha] = useState(format(new Date(), 'yyyy-MM-dd'));

  const { data, isLoading } = useQuery({
    queryKey: ['hoja-ruta', fecha],
    queryFn:  () => api.get(`/hoja-ruta?fecha=${fecha}`).then((r) => r.data),
  });

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between flex-wrap gap-3">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Hoja de Ruta</h1>
          <p className="text-sm text-gray-500 mt-0.5">Operación diaria por vehículo</p>
        </div>
        <div className="flex items-center gap-3">
          <input
            type="date"
            className="input w-auto"
            value={fecha}
            onChange={(e) => setFecha(e.target.value)}
          />
          <button className="btn-primary">+ Nueva hoja</button>
        </div>
      </div>

      <div className="card">
        {isLoading ? (
          <div className="space-y-3 animate-pulse">
            {[...Array(6)].map((_, i) => <div key={i} className="h-14 bg-gray-200 rounded-lg" />)}
          </div>
        ) : data?.data.length === 0 ? (
          <div className="text-center py-12 text-gray-400">
            <div className="text-4xl mb-2">📋</div>
            <p className="text-sm">Sin hojas de ruta para esta fecha</p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Patente</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Conductor</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Salida</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Llegada</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">KM</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Estado</th>
                  <th className="py-3 px-2" />
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {data?.data.map((h: any) => (
                  <tr key={h.id_hoja_ruta} className="hover:bg-gray-50 transition-colors">
                    <td className="py-3 px-2 font-mono font-semibold">{h.patente}</td>
                    <td className="py-3 px-2 text-gray-700">{h.nombre_conductor}</td>
                    <td className="py-3 px-2 text-gray-600">{h.hora_salida ?? '—'}</td>
                    <td className="py-3 px-2 text-gray-600">{h.hora_llegada ?? '—'}</td>
                    <td className="py-3 px-2 text-gray-600">
                      {h.km_recorridos != null ? `${h.km_recorridos} km` : '—'}
                    </td>
                    <td className="py-3 px-2">
                      <span className={ESTADO_BADGE[h.estado] ?? 'badge-gray'}>{h.estado}</span>
                    </td>
                    <td className="py-3 px-2 text-right">
                      <button className="text-brand-600 hover:text-brand-800 text-xs font-medium">Editar</button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
