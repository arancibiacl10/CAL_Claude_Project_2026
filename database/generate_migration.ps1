# ============================================================
# generate_migration.ps1
# Lee SERVITACO_V11_2026.xlsm y genera 05_migracion_excel.sql
# ============================================================
param($XlsmPath = "C:\Proyecto Claude\Servitaco\SERVITACO_V11_2026.xlsm",
      $OutSql   = "C:\Proyecto Claude\Servitaco\database\05_migracion_excel.sql")

Add-Type -Assembly System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($XlsmPath)

# ── Shared strings ─────────────────────────────────────────
$ssEntry = $zip.Entries | Where-Object { $_.FullName -eq "xl/sharedStrings.xml" }
$ssStream = $ssEntry.Open()
[xml]$ssDoc = (New-Object System.IO.StreamReader($ssStream)).ReadToEnd()
$ssStream.Dispose()

$ss = @()
foreach ($si in $ssDoc.sst.si) {
    $text = ''
    if ($si.r) {
        foreach ($rNode in $si.r) { if ($rNode.t) { $text += [string]$rNode.t } }
    } elseif ($si.t) { $text = [string]$si.t }
    $ss += $text.Trim()
}

# ── Parse sheet helper ──────────────────────────────────────
function Parse-Sheet($zip, $fileName, $ss) {
    $entry  = $zip.Entries | Where-Object { $_.FullName -eq $fileName }
    $stream = $entry.Open()
    [xml]$doc = (New-Object System.IO.StreamReader($stream)).ReadToEnd()
    $stream.Dispose()

    $nm = New-Object System.Xml.XmlNamespaceManager($doc.NameTable)
    $nm.AddNamespace('x','http://schemas.openxmlformats.org/spreadsheetml/2006/main')

    $result = [System.Collections.Generic.List[object]]::new()
    foreach ($row in $doc.SelectNodes('//x:sheetData/x:row', $nm)) {
        $rn = [int]$row.GetAttribute('r')
        $rd = [ordered]@{ _row = $rn }
        foreach ($cell in $row.SelectNodes('x:c', $nm)) {
            $col   = [regex]::Match($cell.GetAttribute('r'), '[A-Z]+').Value
            $t     = $cell.GetAttribute('t')
            $vNode = $cell.SelectSingleNode('x:v', $nm)
            if ($null -eq $vNode) { continue }
            $rd[$col] = if ($t -eq 's') {
                $idx = [int]$vNode.InnerText
                if ($idx -lt $ss.Count) { $ss[$idx] } else { '' }
            } else { $vNode.InnerText }
        }
        $result.Add($rd)
    }
    return $result
}

$rowsAutos = Parse-Sheet $zip "xl/worksheets/sheet4.xml" $ss
$rowsCond  = Parse-Sheet $zip "xl/worksheets/sheet6.xml" $ss
$zip.Dispose()

Write-Host "BASE_AUTOS filas : $($rowsAutos.Count)"
Write-Host "BASE_COND  filas : $($rowsCond.Count)"

# ── Helpers SQL ─────────────────────────────────────────────
function Sql-S($val) {
    if ($null -eq $val -or [string]::IsNullOrWhiteSpace($val) -or
        $val -in @('NA','na','N/A','n/a','0')) { return 'NULL' }
    return "'" + $val.ToString().Replace("'","''").Trim() + "'"
}

function Sql-D($serial) {
    if ($null -eq $serial -or $serial -eq '') { return 'NULL' }
    $n = 0.0
    if (-not [double]::TryParse($serial, [Globalization.NumberStyles]::Any,
        [Globalization.CultureInfo]::InvariantCulture, [ref]$n)) { return 'NULL' }
    if ($n -lt 1000 -or $n -gt 80000) { return 'NULL' }
    $epoch = [datetime]::new(1899, 12, 30)
    return "'" + $epoch.AddDays($n).ToString('yyyy-MM-dd') + "'"
}

$estadoMap = @{ 'AUTORIZADO'=1; 'EN TALLER'=2; 'EN_TALLER'=2; 'PERMISO'=3; 'DENEGADO'=4 }

$L = [System.Collections.Generic.List[string]]::new()
$L.Add('SET QUOTED_IDENTIFIER ON;'); $L.Add('SET ANSI_NULLS ON;'); $L.Add('GO')
$L.Add('USE ServitacoDB;'); $L.Add('SET NOCOUNT ON;'); $L.Add('GO'); $L.Add('')

# ── CONDUCTORES ─────────────────────────────────────────────
$L.Add('-- ================================================')
$L.Add('-- CONDUCTORES')
$L.Add('-- ================================================')

$rutSet = [System.Collections.Generic.HashSet[string]]::new()
$condCount = 0

foreach ($row in $rowsCond) {
    if ($row._row -lt 4) { continue }
    $rut    = [string]$row['A']
    $nombre = [string]$row['C']
    if ([string]::IsNullOrWhiteSpace($rut) -or [string]::IsNullOrWhiteSpace($nombre)) { continue }
    $rut = $rut.Trim()
    if ($rut -notmatch '^\d{6,8}-[\dkK]$') { continue }
    if (-not $rutSet.Add($rut)) { continue }

    $dir    = Sql-S $row['D']
    $tel    = Sql-S $row['E']
    $email  = Sql-S $row['F']
    $fi     = Sql-D $row['K']
    $fr     = Sql-D $row['L']
    $vtoLic = Sql-D $row['H']
    $rSql   = Sql-S $rut
    $nSql   = Sql-S $nombre
    $varN   = 'c' + ($rut -replace '[^a-zA-Z0-9]','_')

    $L.Add("IF NOT EXISTS(SELECT 1 FROM flota.Conductor WHERE rut=$rSql)")
    $L.Add("  INSERT INTO flota.Conductor(rut,nombre,direccion,telefono,email,fecha_ingreso,fecha_retiro)")
    $L.Add("  VALUES($rSql,$nSql,$dir,$tel,$email,$fi,$fr);")
    if ($vtoLic -ne 'NULL') {
        $L.Add("INSERT INTO flota.LicenciaConductor(id_conductor,id_tipo_licencia,fecha_vencimiento)")
        $L.Add("SELECT c.id_conductor,1,$vtoLic FROM flota.Conductor c WHERE c.rut=$rSql")
        $L.Add("AND NOT EXISTS(SELECT 1 FROM flota.LicenciaConductor l WHERE l.id_conductor=c.id_conductor);")
    }
    $condCount++
}

$L.Add(''); $L.Add('-- ================================================')
$L.Add('-- VEHICULOS'); $L.Add('-- ================================================')

$patSet = [System.Collections.Generic.HashSet[string]]::new()
$vehCount = 0

foreach ($row in $rowsAutos) {
    if ($row._row -lt 4) { continue }
    $pat = [string]$row['A']
    if ([string]::IsNullOrWhiteSpace($pat)) { continue }
    $pat = $pat.Trim().ToUpper()
    if ($pat -notmatch '^[A-Z]{2,4}-?\d{2,4}$') { continue }
    if (-not $patSet.Add($pat)) { continue }

    $estadoStr = if ($row['M']) { $row['M'].ToString().Trim() } else { 'AUTORIZADO' }
    $idEstado  = if ($estadoMap.ContainsKey($estadoStr)) { $estadoMap[$estadoStr] } else { 1 }
    $fi   = Sql-D $row['N']
    $obs  = Sql-S $row['S']
    $pSql = Sql-S $pat
    $vn   = 'v' + ($pat -replace '[^a-zA-Z0-9]','_')

    # Fecha retiro: O es número y representa fecha < hoy (< 46300 = ~2026-10)
    $fr = 'NULL'
    if ($row['X'] -ne '1') {
        $oVal = 0.0
        if ($row['O'] -and [double]::TryParse([string]$row['O'],
            [Globalization.NumberStyles]::Any,
            [Globalization.CultureInfo]::InvariantCulture, [ref]$oVal)) {
            if ($oVal -gt 40000 -and $oVal -lt 46300) { $fr = Sql-D $row['O'] }
        }
    }

    # Vehículo
    $L.Add("IF NOT EXISTS(SELECT 1 FROM flota.Vehiculo WHERE patente=$pSql)")
    $L.Add("  INSERT INTO flota.Vehiculo(patente,id_estado,fecha_ingreso,fecha_retiro,obs_retiro)")
    $L.Add("  VALUES($pSql,$idEstado,$fi,$fr,$obs);")

    # Documentos (INSERT..SELECT para evitar DECLARE)
    foreach ($doc in @(
        @{s='H';tipo='PERMISO_CIRCULACION'},
        @{s='I';tipo='SEGURO_OBLIGATORIO'},
        @{s='J';tipo='REVISION_TECNICA'}
    )) {
        $vto = Sql-D $row[$doc.s]
        if ($vto -ne 'NULL') {
            $L.Add("INSERT INTO flota.DocumentoVehiculo(id_vehiculo,tipo_documento,fecha_vencimiento)")
            $L.Add("SELECT v.id_vehiculo,'$($doc.tipo)',$vto FROM flota.Vehiculo v")
            $L.Add("WHERE v.patente=$pSql AND NOT EXISTS(SELECT 1 FROM flota.DocumentoVehiculo d WHERE d.id_vehiculo=v.id_vehiculo AND d.tipo_documento='$($doc.tipo)');")
        }
    }

    # Asignación conductor (INSERT..SELECT)
    $rutC = [string]$row['C']
    if ($rutC -match '^\d{6,8}-[\dkK]$') {
        $rCSql = Sql-S $rutC
        $fAsig = if ($fi -ne 'NULL') { $fi } else { 'CAST(GETDATE() AS DATE)' }
        $L.Add("INSERT INTO flota.AsignacionVehiculoConductor(id_vehiculo,id_conductor,fecha_desde)")
        $L.Add("SELECT v.id_vehiculo,c.id_conductor,$fAsig")
        $L.Add("FROM flota.Vehiculo v JOIN flota.Conductor c ON c.rut=$rCSql")
        $L.Add("WHERE v.patente=$pSql")
        $L.Add("AND NOT EXISTS(SELECT 1 FROM flota.AsignacionVehiculoConductor a WHERE a.id_vehiculo=v.id_vehiculo AND a.id_conductor=c.id_conductor);")
    }
    $vehCount++
}

$L.Add('')
$L.Add("DECLARE @nC INT=(SELECT COUNT(*) FROM flota.Conductor);")
$L.Add("DECLARE @nV INT=(SELECT COUNT(*) FROM flota.Vehiculo);")
$L.Add("DECLARE @nD INT=(SELECT COUNT(*) FROM flota.DocumentoVehiculo);")
$L.Add("DECLARE @nA INT=(SELECT COUNT(*) FROM flota.AsignacionVehiculoConductor);")
$L.Add("PRINT 'Conductores : ' + CAST(@nC AS VARCHAR);")
$L.Add("PRINT 'Vehiculos   : ' + CAST(@nV AS VARCHAR);")
$L.Add("PRINT 'Documentos  : ' + CAST(@nD AS VARCHAR);")
$L.Add("PRINT 'Asignaciones: ' + CAST(@nA AS VARCHAR);")
$L.Add('GO')

[System.IO.File]::WriteAllText($OutSql, ($L -join "`n"), [System.Text.Encoding]::UTF8)
Write-Host "Script: $($L.Count) líneas | Conductores: $condCount | Vehículos: $vehCount"
Write-Host "Guardado en: $OutSql"
