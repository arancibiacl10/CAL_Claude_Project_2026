const fs     = require('fs');
const path   = require('path');
const multer = require('multer');

const CARPETA_IMAGENES = path.join(__dirname, '../../uploads/imagenes');
fs.mkdirSync(CARPETA_IMAGENES, { recursive: true });

const EXTENSION_POR_MIMETYPE = {
  'image/jpeg': '.jpg',
  'image/png':  '.png',
  'image/webp': '.webp',
  'image/gif':  '.gif',
};

const storage = multer.diskStorage({
  destination: (_req, _file, cb) => cb(null, CARPETA_IMAGENES),
  filename: (req, file, cb) => {
    const ext = EXTENSION_POR_MIMETYPE[file.mimetype] || '.jpg';
    cb(null, `vehiculo-${req.params.id}-${Date.now()}${ext}`);
  },
});

function soloImagen(_req, file, cb) {
  if (!EXTENSION_POR_MIMETYPE[file.mimetype]) {
    return cb(new Error('La imagen debe ser JPG, PNG, WEBP o GIF'));
  }
  cb(null, true);
}

const uploadImagen = multer({
  storage,
  fileFilter: soloImagen,
  limits: { fileSize: 5 * 1024 * 1024 },
});

module.exports = { uploadImagen, CARPETA_IMAGENES };
