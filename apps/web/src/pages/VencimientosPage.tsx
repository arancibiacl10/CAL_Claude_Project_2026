import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../lib/api';

export default function VencimientosPage() {
  const [dias, setDias] = useState(30);
  const [tab, setTab] = useState<'vehiculos' | 'licencias'>('vehiculos');

  const { data: vVeh } = useQuery({
    queryKey: ['venc-vehiculos', dias],
    queryFn:  () => api.get(`/vehiculos/vencimientos/proximos?dias=${dias}`).then((r) => r.data),
    enabled:  tab === 'vehiculos',
  });

  const { data: vLic } = useQuery({
    queryKey: ['venc-licencias', dias],
    queryFn:  () => api.get(`/conductores/vencimientos/licencias?dias=${dias}`).then((r) => r.data),
    enabled:  tab === 'licencias',
  });

  function urgencia(dias: number) {
    if (dias < 0)  return 'badge-red';
    if (dias <= 7) return 'badge-red';
    if (dias <= 15) return 'badge-yellow';
    return 'badge-blue';
  }

  const datos = tab === 'vehiculos' ? vVeh : vLic;

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between flex-wrap gap-3">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Vencimientos</h1>
          <p className="text-sm text-gray-500 mt-0.5">Alertas de documentos próximos a vencer</p>
        </div>
        <div className="flex items-center gap-2">
          <label className="text-sm text-gray-600">Próximos</label>
          <select className="input w-auto" value={dias} onChange={(e) => setDias(+e.target.value)}>
            <option value={15}>15 días</option>
            <option value={30}>30 días</option>
            <option value={60}>60 días</option>
            <option value={90}>90 días</option>
          </select>
        </div>
      </div>

      <div className="flex gap-1 bg-gray-100 rounded-xl p-1 w-fit">
        {(['vehiculos', 'licencias'] as const).map((t) => (
          <button key={t} onClick={() => setTab(t)}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
              tab === t ? 'bg-white text-gray-900 shadow-sm' : 'text-gray-600 hover:text-gray-900'
            }`}>
            {t === 'vehiculos' ? '🚌 Documentos de vehículos' : '🪪 Licencias de conductores'}
          </button>
        ))}
      </div>

      <div className="card">
        {!datos || datos.length === 0 ? (
          <div className="text-center py-12 text-gray-400">
            <div className="text-4xl mb-2">✅</div>
            <p className="text-sm">Sin vencimientos en los próximos {dias} días</p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-gray-200">
                  {tab === 'vehiculos'
                    ? <><th className="text-left py-3 px-2 font-semibold text-gray-600">Patente</th>
                         <th className="text-left py-3 px-2 font-semibold text-gray-600">Documento</th></>
                    : <><th className="text-left py-3 px-2 font-semibold text-gray-600">RUT</th>
                         <th className="text-left py-3 px-2 font-semibold text-gray-600">Conductor</th>
                         <th className="text-left py-3 px-2 font-semibold text-gray-600">Tipo Licencia</th></>
                  }
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Vencimiento</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Estado</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {datos.map((r: any, i: number) => (
                  <tr key={i} className="hover:bg-gray-50">
                    {tab === 'vehiculos'
                      ? <><td className="py-3 px-2 font-mono font-semibold">{r.patente}</td>
                           <td className="py-3 px-2 text-gray-700">{r.tipo_documento.replace(/_/g,' ')}</td></>
                      : <><td className="py-3 px-2 font-mono text-gray-700">{r.rut}</td>
                           <td className="py-3 px-2 font-medium text-gray-900">{r.nombre}</td>
                           <td className="py-3 px-2 text-gray-600">{r.tipo_licencia}</td></>
                    }
                    <td className="py-3 px-2 text-gray-600">
                      {new Date(r.fecha_vencimiento).toLocaleDateString('es-CL')}
                    </td>
                    <td className="py-3 px-2">
                      <span className={urgencia(r.dias_restantes)}>
                        {r.dias_restantes < 0
                          ? `Vencido hace ${Math.abs(r.dias_restantes)}d`
                          : r.dias_restantes === 0
                          ? 'Vence hoy'
                          : `${r.dias_restantes}d restantes`}
                      </span>
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
