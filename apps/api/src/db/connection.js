const sql    = require('mssql');
const logger = require('../utils/logger');

const config = {
  server:   process.env.DB_SERVER   || 'localhost',
  port:     parseInt(process.env.DB_PORT || '1433'),
  database: process.env.DB_NAME     || 'ServitacoDB',
  user:     process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  options: {
    encrypt:                process.env.DB_ENCRYPT    === 'true',
    trustServerCertificate: process.env.DB_TRUST_CERT !== 'false',
    enableArithAbort:       true,
  },
  pool: {
    max:               10,
    min:               2,
    idleTimeoutMillis: 30000,
  },
};

let pool = null;

async function connectDB() {
  try {
    pool = await sql.connect(config);
    logger.info('Conexión a SQL Server establecida');
    return pool;
  } catch (err) {
    logger.error('Error conectando a SQL Server:', err.message);
    throw err;
  }
}

function getPool() {
  if (!pool) throw new Error('DB no inicializada. Llamar connectDB() primero.');
  return pool;
}

module.exports = { connectDB, getPool, sql };
