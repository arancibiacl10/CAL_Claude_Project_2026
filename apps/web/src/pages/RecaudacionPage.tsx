import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../lib/api';

const MESES = ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
               'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'];

export default function RecaudacionPage() {
  const hoy = new Date();
  const [anio, setAnio] = useState(hoy.getFullYear());
  const [mes,  setMes]  = useState(hoy.getMonth() + 1);

  const { data, isLoading } = useQuery({
    queryKey: ['recaudacion', anio, mes],
    queryFn:  () => api.get(`/recaudacion?anio=${anio}&mes=${mes}`).then((r) => r.data),
  });

  const fmt = (n: number) => `$${n.toLocaleString('es-CL')}`;

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between flex-wrap gap-3">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Recaudación</h1>
          <p className="text-sm text-gray-500 mt-0.5">Registro diario por vehículo</p>
        </div>
        <div className="flex items-center gap-2">
          <select className="input w-auto" value={mes} onChange={(e) => setMes(+e.target.value)}>
            {MESES.map((m, i) => <option key={i} value={i + 1}>{m}</option>)}
          </select>
          <input type="number" className="input w-24" value={anio} min={2020} max={2099}
            onChange={(e) => setAnio(+e.target.value)} />
          <button className="btn-primary">+ Registrar</button>
        </div>
      </div>

      {/* Resumen */}
      {data?.resumen && (
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {[
            { label: 'Días operados',     value: data.resumen.dias_operados },
            { label: 'Total bruto',       value: fmt(data.resumen.total_bruto ?? 0) },
            { label: 'Descuentos',        value: fmt(data.resumen.total_descuentos ?? 0) },
            { label: 'Total neto',        value: fmt(data.resumen.total_neto ?? 0) },
          ].map(({ label, value }) => (
            <div key={label} className="card py-4">
              <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">{label}</p>
              <p className="text-xl font-bold text-gray-900 mt-1">{value}</p>
            </div>
          ))}
        </div>
      )}

      <div className="card">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-gray-200">
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Fecha</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Patente</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Conductor</th>
                <th className="text-right py-3 px-2 font-semibold text-gray-600">Bruto</th>
                <th className="text-right py-3 px-2 font-semibold text-gray-600">Descuento</th>
                <th className="text-right py-3 px-2 font-semibold text-gray-600">Neto</th>
                <th className="text-left py-3 px-2 font-semibold text-gray-600">Tipo</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {isLoading
                ? [...Array(8)].map((_, i) => (
                    <tr key={i} className="animate-pulse">
                      {[...Array(7)].map((__, j) => (
                        <td key={j} className="py-3 px-2"><div className="h-4 bg-gray-200 rounded w-20" /></td>
                      ))}
                    </tr>
                  ))
                : data?.registros.map((r: any) => (
                    <tr key={r.id_recaudacion} className="hover:bg-gray-50">
                      <td className="py-3 px-2 text-gray-600">
                        {new Date(r.fecha).toLocaleDateString('es-CL')}
                      </td>
                      <td className="py-3 px-2 font-mono font-semibold">{r.patente}</td>
                      <td className="py-3 px-2 text-gray-700">{r.nombre_conductor}</td>
                      <td className="py-3 px-2 text-right text-gray-700">{fmt(r.monto_bruto)}</td>
                      <td className="py-3 px-2 text-right text-red-500">{r.descuentos > 0 ? `-${fmt(r.descuentos)}` : '—'}</td>
                      <td className="py-3 px-2 text-right font-semibold text-green-700">{fmt(r.monto_neto)}</td>
                      <td className="py-3 px-2">
                        <span className={r.tipo_pago === 'NORMAL' ? 'badge-green' : r.tipo_pago === 'ADELANTADO' ? 'badge-blue' : 'badge-yellow'}>
                          {r.tipo_pago}
                        </span>
                      </td>
                    </tr>
                  ))}
            </tbody>
          </table>
          {!isLoading && data?.registros.length === 0 && (
            <div className="text-center py-12 text-gray-400">
              <div className="text-4xl mb-2">💰</div>
              <p className="text-sm">Sin registros para {MESES[mes - 1]} {anio}</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
