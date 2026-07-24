import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { useAuthStore } from './store/authStore';
import Layout from './components/Layout';
import LoginPage from './pages/LoginPage';
import DashboardPage from './pages/DashboardPage';
import VehiculosPage from './pages/VehiculosPage';
import ConductoresPage from './pages/ConductoresPage';
import HojaRutaPage from './pages/HojaRutaPage';
import ControlMensualPage from './pages/ControlMensualPage';
import RecaudacionPage from './pages/RecaudacionPage';
import PagosPage from './pages/PagosPage';
import VencimientosPage from './pages/VencimientosPage';

function PrivateRoute({ children }: { children: React.ReactNode }) {
  const token = useAuthStore((s) => s.token);
  return token ? <>{children}</> : <Navigate to="/login" replace />;
}

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/" element={<PrivateRoute><Layout /></PrivateRoute>}>
          <Route index element={<Navigate to="/dashboard" replace />} />
          <Route path="dashboard"      element={<DashboardPage />} />
          <Route path="vehiculos"      element={<VehiculosPage />} />
          <Route path="conductores"    element={<ConductoresPage />} />
          <Route path="hoja-ruta"      element={<HojaRutaPage />} />
          <Route path="control"        element={<ControlMensualPage />} />
          <Route path="recaudacion"    element={<RecaudacionPage />} />
          <Route path="pagos"          element={<PagosPage />} />
          <Route path="vencimientos"   element={<VencimientosPage />} />
        </Route>
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  );
}
