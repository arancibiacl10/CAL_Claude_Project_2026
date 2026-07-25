import { useState } from 'react';

function formatBytes(bytes: number): string {
  if (bytes < 1024) return `${bytes} B`;
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(0)} KB`;
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}

export default function FileDropzone({
  label, accept, icon, hint, file, error, onFile,
}: {
  label: string; accept: string; icon: string; hint: string;
  file: File | null; error?: string; onFile: (file: File | null) => void;
}) {
  const [dragOver, setDragOver] = useState(false);
  const inputId = `dropzone-${label.replace(/\s+/g, '-').toLowerCase()}`;

  return (
    <div>
      <label className="label">{label}</label>
      <label
        htmlFor={inputId}
        onDragOver={(e) => { e.preventDefault(); setDragOver(true); }}
        onDragLeave={() => setDragOver(false)}
        onDrop={(e) => {
          e.preventDefault();
          setDragOver(false);
          onFile(e.dataTransfer.files?.[0] ?? null);
        }}
        className={`flex items-center gap-3 rounded-lg border-2 border-dashed px-4 py-3 cursor-pointer transition-colors ${
          dragOver ? 'border-brand-500 bg-brand-50' : error ? 'border-red-300 bg-red-50/40' : 'border-gray-300 hover:border-brand-400 hover:bg-brand-50/40'
        }`}
      >
        <span className="text-2xl leading-none">{icon}</span>
        <div className="min-w-0 flex-1">
          {file ? (
            <>
              <p className="text-sm font-medium text-gray-900 truncate">{file.name}</p>
              <p className="text-xs text-gray-400">{formatBytes(file.size)}</p>
            </>
          ) : (
            <>
              <p className="text-sm text-gray-600">
                Arrastrá un archivo aquí o <span className="text-brand-600 font-medium">buscá en tu equipo</span>
              </p>
              <p className="text-xs text-gray-400 mt-0.5">{hint}</p>
            </>
          )}
        </div>
        {file && (
          <button
            type="button"
            onClick={(e) => { e.preventDefault(); e.stopPropagation(); onFile(null); }}
            className="text-gray-400 hover:text-red-600 text-lg leading-none px-1"
            aria-label="Quitar archivo"
          >
            &times;
          </button>
        )}
      </label>
      <input
        id={inputId}
        type="file"
        accept={accept}
        className="hidden"
        onChange={(e) => onFile(e.target.files?.[0] ?? null)}
      />
      {error && <p className="text-xs text-red-600 mt-1">{error}</p>}
    </div>
  );
}
