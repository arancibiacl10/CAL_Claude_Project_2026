import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import api from '../lib/api';

export default function PagosPage() {
  const [tab, setTab] = useState<'adelantados' | 'atrasados'>('atrasados');

  const { data: atrasados, isLoading: loadingA } = useQuery({
    queryKey: ['pagos-atrasados'],
    queryFn:  () => api.get('/pagos/atrasados?estado=PENDIENTE').then((r) => r.data),
    enabled:  tab === 'atrasados',
  });

  const { data: adelantados, isLoading: loadingAd } = useQuery({
    queryKey: ['pagos-adelantados'],
    queryFn:  () => api.get('/pagos/adelantados').then((r) => r.data),
    enabled:  tab === 'adelantados',
  });

  const fmt = (n: number) => `$${n.toLocaleString('es-CL')}`;

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Pagos</h1>
          <p className="text-sm text-gray-500 mt-0.5">Adelantados y adeudados</p>
        </div>
        <button className="btn-primary">+ Registrar</button>
      </div>

      <div className="flex gap-1 bg-gray-100 rounded-xl p-1 w-fit">
        {(['atrasados', 'adelantados'] as const).map((t) => (
          <button key={t} onClick={() => setTab(t)}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors capitalize ${
              tab === t ? 'bg-white text-gray-900 shadow-sm' : 'text-gray-600 hover:text-gray-900'
            }`}>
            {t === 'atrasados' ? '⚠️ Deudas pendientes' : '✅ Pagos adelantados'}
          </button>
        ))}
      </div>

      <div className="card">
        {tab === 'atrasados' && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Conductor</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Patente</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Fecha origen</th>
                  <th className="text-right py-3 px-2 font-semibold text-gray-600">Deuda</th>
                  <th className="text-right py-3 px-2 font-semibold text-gray-600">Pagado</th>
                  <th className="text-right py-3 px-2 font-semibold text-gray-600">Saldo</th>
                  <th className="py-3 px-2" />
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {loadingA
                  ? [...Array(5)].map((_, i) => (
                      <tr key={i} className="animate-pulse">
                        {[...Array(7)].map((__, j) => (
                          <td key={j} className="py-3 px-2"><div className="h-4 bg-gray-200 rounded w-20" /></td>
                        ))}
                      </tr>
                    ))
                  : atrasados?.data.map((p: any) => (
                      <tr key={p.id_deuda} className="hover:bg-gray-50">
                        <td className="py-3 px-2 font-medium text-gray-900">{p.nombre_conductor}</td>
                        <td className="py-3 px-2 font-mono">{p.patente}</td>
                        <td className="py-3 px-2 text-gray-600">{new Date(p.fecha_origen).toLocaleDateString('es-CL')}</td>
                        <td className="py-3 px-2 text-right text-gray-700">{fmt(p.monto_deuda)}</td>
                        <td className="py-3 px-2 text-right text-green-600">{fmt(p.monto_pagado)}</td>
                        <td className="py-3 px-2 text-right font-bold text-red-600">{fmt(p.saldo_pendiente)}</td>
                        <td className="py-3 px-2 text-right">
                          <button className="text-brand-600 hover:text-brand-800 text-xs font-medium">Abonar</button>
                        </td>
                      </tr>
                    ))}
              </tbody>
            </table>
            {!loadingA && atrasados?.data.length === 0 && (
              <div className="text-center py-12 text-gray-400">
                <div className="text-4xl mb-2">✅</div>
                <p className="text-sm">Sin deudas pendientes</p>
              </div>
            )}
          </div>
        )}

        {tab === 'adelantados' && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-gray-200">
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Conductor</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Patente</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Fecha pago</th>
                  <th className="text-left py-3 px-2 font-semibold text-gray-600">Período</th>
                  <th className="text-right py-3 px-2 font-semibold text-gray-600">Monto</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {loadingAd
                  ? [...Array(5)].map((_, i) => (
                      <tr key={i} className="animate-pulse">
                        {[...Array(5)].map((__, j) => (
                          <td key={j} className="py-3 px-2"><div className="h-4 bg-gray-200 rounded w-20" /></td>
                        ))}
                      </tr>
                    ))
                  : adelantados?.data.map((p: any) => (
                      <tr key={p.id_pago} className="hover:bg-gray-50">
                        <td className="py-3 px-2 font-medium text-gray-900">{p.nombre_conductor}</td>
                        <td className="py-3 px-2 font-mono">{p.patente}</td>
                        <td className="py-3 px-2 text-gray-600">{new Date(p.fecha_pago).toLocaleDateString('es-CL')}</td>
                        <td className="py-3 px-2 text-gray-600 text-xs">
                          {new Date(p.fecha_periodo_desde).toLocaleDateString('es-CL')} → {new Date(p.fecha_periodo_hasta).toLocaleDateString('es-CL')}
                        </td>
                        <td className="py-3 px-2 text-right font-semibold text-green-700">{fmt(p.monto)}</td>
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
