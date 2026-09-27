# 사후정산 board rebuild (run on DESKTOP-MV93US1). Do NOT register cron here — Air 08:00 attaches.
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File rebuild.ps1
$ErrorActionPreference = 'Stop'
$Root = 'Z:\HDD1\MARU'
$Out  = Join-Path $Root 'dashboard\사후정산'
$SrcA = Join-Path $Root '생산부\정산서'
$SrcB = Join-Path $Root '생산부\GOODTRUST\정산서'
$Status = Join-Path $Root 'dashboard\status\data.json'
New-Item -ItemType Directory -Force -Path $Out | Out-Null

function Test-Excluded([string]$p) {
  return ($p -match '누락작지|관리부|\\ETC\\|/ETC/')
}
function Get-BrandMonth([string]$rel, [string]$src) {
  $brand = if ($src -eq 'GT') { '굿트러스트' } else { '디즈니' }
  $month = ''
  if ($rel -match '(\\d+월)') { $month = $Matches[1] }
  if ($src -eq 'PROD' -and $rel -match '디즈니') { $brand = '디즈니' }
  elseif ($src -eq 'PROD' -and $rel -match '굿트') { $brand = '굿트러스트' }
  return @{ brand = $brand; month = $month }
}

$items = @()
function Add-Tree([string]$base, [string]$srcLabel, [string]$hrefPrefix) {
  if (-not (Test-Path -LiteralPath $base)) { return }
  Get-ChildItem -LiteralPath $base -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
    $full = $_.FullName
    if (Test-Excluded $full) { return }
    $ext = $_.Extension.ToLower()
    if ($ext -notin @('.xlsx','.xls','.pdf','.xlsm','.csv')) { return }
    $relWin = $full.Substring($Root.Length).TrimStart('\')
    $relUrl = ($hrefPrefix + ($full.Substring($base.Length).TrimStart('\'))) -replace '\\','/'
    # href from dashboard\사후정산 → ../../생산부/...
    $href = '../../' + ($relWin -replace '\\','/')
    $bm = Get-BrandMonth $relWin $srcLabel
    $name = $_.Name
    $isPack = [bool]($name -match '패킹|완사입|결제리스트|packing')
    $items += [pscustomobject]@{
      src=$srcLabel; brand=$bm.brand; year=''; month=$bm.month
      path=$relWin; name=$name; ext=$ext; bytes=[int64]$_.Length
      mtime=$_.LastWriteTime.ToString('yyyy-MM-dd HH:mm'); href=$href; isPacking=$isPack
    }
  }
}
Add-Tree $SrcA 'PROD' ''
Add-Tree $SrcB 'GT' ''

$statusMeta = $null
if (Test-Path -LiteralPath $Status) {
  try {
    $st = Get-Content -LiteralPath $Status -Raw -Encoding UTF8 | ConvertFrom-Json
    $m = $st.meta
    $statusMeta = @{
      ordersN=$m.n; completeN=$m.completeN; completeQ=$m.completeQ
      inboundN=$m.inboundN; inboundQ=$m.inboundQ; shipN=$m.shipN; shipQ=$m.shipQ
      unshipOverdueN=$m.unshipOverdueN; unshipOverdueQ=$m.unshipOverdueQ
      asOf=$m.asOf; month=$m.month
      sourceNote='status/data.json meta only — no forced brand/PO join'
      byTeam=$m.teamKpis
    }
  } catch {}
}

$gen = Get-Date -Format 'yyyy-MM-dd HH:mm'
$data = [ordered]@{
  generated=$gen
  scope='정산서만(누락작지·관리부 제외) · 패킹=파일명 · 종결=status meta'
  targetZ=$Out
  count=$items.Count
  packingN=@($items | Where-Object { $_.isPacking }).Count
  statusMeta=$statusMeta
  items=$items
}
$jsonPath = Join-Path $Out 'data.json'
($data | ConvertTo-Json -Depth 8) | Set-Content -LiteralPath $jsonPath -Encoding UTF8

# Prefer regenerating HTML via existing index template on box copy; if python present, parent may replace.
# Minimal: keep sibling index.html if present; stamp note file.
$note = Join-Path $Out 'REBUILD_NOTE.txt'
@"
rebuilt $gen
count=$($items.Count) packingN=$($data.packingN)
status asOf=$($statusMeta.asOf) shipN=$($statusMeta.shipN) unshipOverdueN=$($statusMeta.unshipOverdueN)
No morning/cron registered here. Air 08:00 owns refresh.
"@ | Set-Content -LiteralPath $note -Encoding UTF8
Write-Host "OK $($items.Count) files -> $Out"
