// Validación de patente chilena, formato único nacional vigente desde 2007:
// 4 letras + 2 dígitos (autos, camionetas, buses y camiones; no motos).

const FORMATO = /^[A-Z]{4}[0-9]{2}$/;

export function limpiarPatente(patente: string): string {
  return (patente || '').replace(/[^a-zA-Z0-9]/g, '').toUpperCase();
}

export function validarPatente(patente: string): boolean {
  return FORMATO.test(limpiarPatente(patente));
}

// Normaliza a formato 'BXSH-97'.
export function formatearPatente(patente: string): string {
  const limpia = limpiarPatente(patente);
  return `${limpia.slice(0, 4)}-${limpia.slice(4)}`;
}
