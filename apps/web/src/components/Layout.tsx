import { Outlet, NavLink, useNavigate } from 'react-router-dom';
import { useAuthStore } from '../store/authStore';

const nav = [
  { to: '/dashboard',    label: 'Dashboard',        icon: '📊' },
  { to: '/hoja-ruta',   label: 'Hoja de Ruta',     icon: '🗺️' },
  { to: '/control',     label: 'Control Mensual',   icon: '📅' },
  { to: '/recaudacion', label: 'Recaudación',       icon: '💰' },
  { to: '/pagos',       label: 'Pagos',             icon: '💳' },
  { to: '/vehiculos',   label: 'Vehículos',         icon: '🚌' },
  { to: '/mantenimiento',label: 'Mantenimiento',    icon: '🔧' },
  { to: '/conductores', label: 'Conductores',       icon: '👤' },
  { to: '/vencimientos',label: 'Vencimientos',      icon: '⚠️' },
];

export default function Layout() {
  const { user, logout } = useAuthStore();
  const navigate          = useNavigate();

  function handleLogout() {
    logout();
    navigate('/login');
  }

  return (
    <div className="flex h-screen bg-gray-50">
      {/* Sidebar */}
      <aside className="w-64 bg-brand-900 text-white flex flex-col shadow-xl">
        <div className="px-6 py-5 border-b border-brand-700">
          <div className="text-xs font-semibold text-brand-100 uppercase tracking-widest">Línea 105</div>
          <div className="text-xl font-bold mt-0.5">Servitaco</div>
        </div>

        <nav className="flex-1 px-3 py-4 space-y-0.5 overflow-y-auto">
          {nav.map(({ to, label, icon }) => (
            <NavLink
              key={to}
              to={to}
              className={({ isActive }) =>
                `flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-colors ${
                  isActive
                    ? 'bg-brand-600 text-white'
                    : 'text-brand-100 hover:bg-brand-700 hover:text-white'
                }`
              }
            >
              <span className="text-base">{icon}</span>
              {label}
            </NavLink>
          ))}
        </nav>

        <div className="px-4 py-4 border-t border-brand-700">
          <div className="text-xs text-brand-200 mb-1 truncate">{user?.nombre}</div>
          <div className="text-xs text-brand-300 mb-3">{user?.rol}</div>
          <button onClick={handleLogout} className="w-full text-left text-xs text-brand-300 hover:text-white transition-colors">
            Cerrar sesión →
          </button>
        </div>
      </aside>

      {/* Contenido */}
      <main className="flex-1 overflow-y-auto">
        <div className="p-8">
          <Outlet />
        </div>
      </main>
    </div>
  );
}
