import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import { getDaysInMonth, format, parseISO } from 'date-fns';
import { es } from 'date-fns/locale';
import api from '../lib/api';

const ESTADO_COLOR: Record<string, string> = {
  TRABAJO:     'bg-green-200 text-green-800',
  DESCANSO:    'bg-gray-200 text-gray-600',
  FERIADO:     'bg-blue-200 text-blue-800',
  PERMISO:     'bg-purple-200 text-purple-800',
  AUSENTE:     'bg-red-200 text-red-700',
  SIN_SERVICIO:'bg-yellow-200 text-yellow-800',
};

const MESES = ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
               'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'];

export default function ControlMensualPage() {
  const hoy  = new Date();
  const [anio, setAnio] = useState(hoy.getFullYear());
  const [mes,  setMes]  = useState(hoy.getMonth() + 1);

  const { data, isLoading } = useQuery({
    queryKey: ['control', anio, mes],
    queryFn:  () => api.get(`/control?anio=${anio}&mes=${mes}`).then((r) => r.data),
  });

  const diasDelMes = getDaysInMonth(new Date(anio, mes - 1));
  const diasArr    = Array.from({ length: diasDelMes }, (_, i) => i + 1);

  // Agrupar por vehículo+conductor
  const filas = new Map<string, { key: string; patente: string; conductor: string; dias: Record<number, string> }>();
  (data?.registros ?? []).forEach((r: any) => {
    const key = `${r.id_vehiculo}-${r.id_conductor}`;
    if (!filas.has(key)) filas.set(key, { key, patente: r.patente, conductor: r.nombre_conductor, dias: {} });
    const dia = parseISO(r.fecha).getDate();
    filas.get(key)!.dias[dia] = r.estado_dia;
  });

  const feriados = new Set((data?.feriados ?? []).map((f: any) => parseISO(f.fecha).getDate()));

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between flex-wrap gap-3">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Control Mensual</h1>
          <p className="text-sm text-gray-500 mt-0.5">Registro de operación por día</p>
        </div>
        <div className="flex items-center gap-2">
          <select className="input w-auto" value={mes} onChange={(e) => setMes(+e.target.value)}>
            {MESES.map((m, i) => <option key={i} value={i + 1}>{m}</option>)}
          </select>
          <input type="number" className="input w-24" value={anio}
            min={2020} max={2099} onChange={(e) => setAnio(+e.target.value)} />
        </div>
      </div>

      {/* Leyenda */}
      <div className="flex flex-wrap gap-2">
        {Object.entries(ESTADO_COLOR).map(([k, v]) => (
          <span key={k} className={`text-xs px-2 py-0.5 rounded font-medium ${v}`}>{k}</span>
        ))}
      </div>

      <div className="card overflow-x-auto p-0">
        {isLoading ? (
          <div className="p-6 animate-pulse space-y-3">
            {[...Array(5)].map((_, i) => <div key={i} className="h-10 bg-gray-200 rounded" />)}
          </div>
        ) : filas.size === 0 ? (
          <div className="text-center py-12 text-gray-400 p-6">
            <div className="text-4xl mb-2">📅</div>
            <p className="text-sm">Sin registros para {MESES[mes - 1]} {anio}</p>
          </div>
        ) : (
          <table className="w-full text-xs">
            <thead>
              <tr className="border-b border-gray-200 bg-gray-50">
                <th className="text-left py-2 px-3 font-semibold text-gray-600 sticky left-0 bg-gray-50 min-w-[130px]">Vehículo</th>
                <th className="text-left py-2 px-3 font-semibold text-gray-600 sticky left-[130px] bg-gray-50 min-w-[160px]">Conductor</th>
                {diasArr.map((d) => (
                  <th key={d} className={`py-2 px-1 font-semibold text-center min-w-[32px] ${feriados.has(d) ? 'text-blue-600' : 'text-gray-600'}`}>
                    {d}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {[...filas.values()].map((fila) => (
                <tr key={fila.key} className="hover:bg-gray-50">
                  <td className="py-2 px-3 font-mono font-semibold text-gray-900 sticky left-0 bg-white">{fila.patente}</td>
                  <td className="py-2 px-3 text-gray-700 sticky left-[130px] bg-white truncate max-w-[160px]">{fila.conductor}</td>
                  {diasArr.map((d) => {
                    const estado = fila.dias[d];
                    const esFeriado = feriados.has(d);
                    return (
                      <td key={d} className="py-1 px-0.5 text-center">
                        {estado ? (
                          <span title={estado} className={`inline-block w-7 h-6 rounded text-center leading-6 font-medium ${ESTADO_COLOR[estado] ?? 'bg-gray-100'}`}>
                            {estado[0]}
                          </span>
                        ) : esFeriado ? (
                          <span className="inline-block w-7 h-6 rounded bg-blue-50 text-blue-300 text-center leading-6">F</span>
                        ) : (
                          <span className="inline-block w-7 h-6 rounded text-gray-200 text-center leading-6">·</span>
                        )}
                      </td>
                    );
                  })}
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}
