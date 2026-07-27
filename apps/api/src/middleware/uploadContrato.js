const fs     = require('fs');
const path   = require('path');
const multer = require('multer');

const CARPETA_CONTRATOS = path.join(__dirname, '../../uploads/contratos');
fs.mkdirSync(CARPETA_CONTRATOS, { recursive: true });

const storage = multer.diskStorage({
  destination: (_req, _file, cb) => cb(null, CARPETA_CONTRATOS),
  filename: (req, _file, cb) => cb(null, `contrato-${req.params.id}-${Date.now()}.pdf`),
});

function soloPdf(_req, file, cb) {
  if (file.mimetype !== 'application/pdf') {
    return cb(new Error('El contrato debe ser un archivo PDF'));
  }
  cb(null, true);
}

const uploadContrato = multer({
  storage,
  fileFilter: soloPdf,
  limits: { fileSize: 10 * 1024 * 1024 },
});

module.exports = { uploadContrato, CARPETA_CONTRATOS };
