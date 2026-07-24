// Helpers para construir queries paginadas y con filtros dinámicos
const { getPool, sql } = require('./connection');

async function query(text, inputs = []) {
  const pool    = getPool();
  const request = pool.request();
  inputs.forEach(({ name, type, value }) => request.input(name, type, value));
  return request.query(text);
}

async function queryOne(text, inputs = []) {
  const result = await query(text, inputs);
  return result.recordset?.[0] ?? null;
}

function paginate(page = 1, pageSize = 50) {
  const p    = Math.max(1, parseInt(page));
  const size = Math.min(200, Math.max(1, parseInt(pageSize)));
  const offset = (p - 1) * size;
  return { page: p, pageSize: size, offset };
}

module.exports = { query, queryOne, paginate, sql };
