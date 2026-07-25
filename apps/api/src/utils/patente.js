// Validación de patente chilena, formato único nacional vigente desde 2007:
// 4 letras + 2 dígitos (autos, camionetas, buses y camiones; no motos).

const FORMATO = /^[A-Z]{4}[0-9]{2}$/;

function limpiarPatente(patente) {
  return String(patente || '').replace(/[^a-zA-Z0-9]/g, '').toUpperCase();
}

function validarPatente(patente) {
  return FORMATO.test(limpiarPatente(patente));
}

// Normaliza a formato 'BXSH-97'.
function formatearPatente(patente) {
  const limpia = limpiarPatente(patente);
  return `${limpia.slice(0, 4)}-${limpia.slice(4)}`;
}

module.exports = { limpiarPatente, validarPatente, formatearPatente };
