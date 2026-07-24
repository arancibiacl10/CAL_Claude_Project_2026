import { useQuery } from '@tanstack/react-query';
import api from '../lib/api';
import { format } from 'date-fns';
import { es } from 'date-fns/locale';
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Cell } from 'recharts';

interface DashData {
  flota: { codigo: string; descripcion: string; cantidad: number }[];
  alertas: { vencimientos_vehiculos: number; vencimientos_licencias: number };
  recaudacion_mes_actual: number;
  deudas_pendientes: number;
}

const ESTADO_COLOR: Record<string, string> = {
  AUTORIZADO: '#16a34a',
  EN_TALLER:  '#d97706',
  PERMISO:    '#2563eb',
  DENEGADO:   '#dc2626',
};

export default function DashboardPage() {
  const hoy = format(new Date(), "EEEE dd 'de' MMMM yyyy", { locale: es });

  const { data, isLoading } = useQuery<DashData>({
    queryKey: ['dashboard'],
    queryFn:  () => api.get('/reportes/dashboard').then((r) => r.data),
  });

  if (isLoading) return <Skeleton />;

  const totalFlota = data?.flota.reduce((s, f) => s + f.cantidad, 0) ?? 0;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Dashboard</h1>
        <p className="text-sm text-gray-500 capitalize mt-0.5">{hoy}</p>
      </div>

      {/* KPIs */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <KpiCard
          label="Flota total activa"
          value={totalFlota}
          icon="🚌"
          color="brand"
        />
        <KpiCard
          label="Recaudación del mes"
          value={`$${Number(data?.recaudacion_mes_actual ?? 0).toLocaleString('es-CL')}`}
          icon="💰"
          color="green"
        />
        <KpiCard
          label="Vencimientos próximos (30d)"
          value={(data?.alertas.vencimientos_vehiculos ?? 0) + (data?.alertas.vencimientos_licencias ?? 0)}
          icon="⚠️"
          color="yellow"
          sublabel={`${data?.alertas.vencimientos_vehiculos} vehículos · ${data?.alertas.vencimientos_licencias} licencias`}
        />
        <KpiCard
          label="Deudas pendientes"
          value={`$${Number(data?.deudas_pendientes ?? 0).toLocaleString('es-CL')}`}
          icon="💳"
          color="red"
        />
      </div>

      {/* Gráfico flota por estado */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="card">
          <h2 className="text-base font-semibold text-gray-800 mb-4">Estado de la Flota</h2>
          <ResponsiveContainer width="100%" height={220}>
            <BarChart data={data?.flota} barCategoryGap="35%">
              <XAxis dataKey="descripcion" tick={{ fontSize: 12 }} />
              <YAxis allowDecimals={false} tick={{ fontSize: 12 }} />
              <Tooltip formatter={(v: number) => [`${v} vehículos`]} />
              <Bar dataKey="cantidad" radius={[4, 4, 0, 0]}>
                {data?.flota.map((f) => (
                  <Cell key={f.codigo} fill={ESTADO_COLOR[f.codigo] ?? '#6b7280'} />
                ))}
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="card">
          <h2 className="text-base font-semibold text-gray-800 mb-4">Resumen de Estado</h2>
          <div className="space-y-3">
            {data?.flota.map((f) => (
              <div key={f.codigo} className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full" style={{ background: ESTADO_COLOR[f.codigo] ?? '#6b7280' }} />
                  <span className="text-sm text-gray-700">{f.descripcion}</span>
                </div>
                <span className="text-sm font-semibold text-gray-900">{f.cantidad}</span>
              </div>
            ))}
            <div className="pt-2 border-t flex justify-between">
              <span className="text-sm font-medium text-gray-600">Total</span>
              <span className="text-sm font-bold text-gray-900">{totalFlota}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

function KpiCard({ label, value, icon, color, sublabel }: {
  label: string; value: string | number; icon: string;
  color: 'brand' | 'green' | 'yellow' | 'red'; sublabel?: string;
}) {
  const bg: Record<string, string> = {
    brand:  'bg-brand-50  border-brand-200',
    green:  'bg-green-50  border-green-200',
    yellow: 'bg-yellow-50 border-yellow-200',
    red:    'bg-red-50    border-red-200',
  };
  const text: Record<string, string> = {
    brand: 'text-brand-700', green: 'text-green-700',
    yellow: 'text-yellow-700', red: 'text-red-700',
  };
  return (
    <div className={`rounded-xl border p-5 ${bg[color]}`}>
      <div className="flex items-start justify-between">
        <div>
          <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">{label}</p>
          <p className={`text-2xl font-bold mt-1 ${text[color]}`}>{value}</p>
          {sublabel && <p className="text-xs text-gray-400 mt-0.5">{sublabel}</p>}
        </div>
        <span className="text-2xl">{icon}</span>
      </div>
    </div>
  );
}

function Skeleton() {
  return (
    <div className="space-y-6 animate-pulse">
      <div className="h-8 bg-gray-200 rounded w-48" />
      <div className="grid grid-cols-4 gap-4">
        {[...Array(4)].map((_, i) => <div key={i} className="h-28 bg-gray-200 rounded-xl" />)}
      </div>
      <div className="grid grid-cols-2 gap-6">
        <div className="h-72 bg-gray-200 rounded-xl" />
        <div className="h-72 bg-gray-200 rounded-xl" />
      </div>
    </div>
  );
}
