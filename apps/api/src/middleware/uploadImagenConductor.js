const fs     = require('fs');
const path   = require('path');
const multer = require('multer');

const CARPETA_IMAGENES_CONDUCTOR = path.join(__dirname, '../../uploads/conductores');
fs.mkdirSync(CARPETA_IMAGENES_CONDUCTOR, { recursive: true });

const EXTENSION_POR_MIMETYPE = {
  'image/jpeg': '.jpg',
  'image/png':  '.png',
  'image/webp': '.webp',
  'image/gif':  '.gif',
};

const storage = multer.diskStorage({
  destination: (_req, _file, cb) => cb(null, CARPETA_IMAGENES_CONDUCTOR),
  filename: (req, file, cb) => {
    const ext = EXTENSION_POR_MIMETYPE[file.mimetype] || '.jpg';
    const tipo = req.body.tipo === 'FOTO_LICENCIA' ? 'licencia' : 'conductor';
    cb(null, `${tipo}-${req.params.id}-${Date.now()}${ext}`);
  },
});

function soloImagen(_req, file, cb) {
  if (!EXTENSION_POR_MIMETYPE[file.mimetype]) {
    return cb(new Error('La imagen debe ser JPG, PNG, WEBP o GIF'));
  }
  cb(null, true);
}

const uploadImagenConductor = multer({
  storage,
  fileFilter: soloImagen,
  limits: { fileSize: 5 * 1024 * 1024 },
});

module.exports = { uploadImagenConductor, CARPETA_IMAGENES_CONDUCTOR };
