$ErrorActionPreference = "Stop"

$Repo = "ryanoasis/nerd-fonts"
$Font = "JetBrainsMono"
$Dest = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\$($Font)NerdFont"

New-Item -ItemType Directory -Force -Path $Dest | Out-Null
Set-Location $Dest

Write-Host "Fetching latest release info..."
$Release = Invoke-RestMethod "https://api.github.com/repos/$Repo/releases"
$Asset = $Release[0].assets | Where-Object { $_.name -eq "$Font.tar.xz" }

if (-not $Asset) { throw "JetBrainsMono.tar.xz not found in latest release" }

$Url = $Asset.browser_download_url
$Archive = "$Font.tar.xz"

Write-Host "Downloading $Url"
Invoke-WebRequest $Url -OutFile $Archive

function Extract-WithTar {
  try {
    Write-Host "Trying tar..."
    tar -xf $Archive
    return $true
  } catch { return $false }
}

function Extract-With7Zip {
  if (-not (Get-Command 7z -ErrorAction SilentlyContinue)) {
    throw "7z not found. Install 7-Zip (7z.exe) from https://www.7-zip.org/"
  }
  Write-Host "Extracting with 7zip..."
  7z x $Archive -y | Out-Null
  7z x "$Font.tar" -y | Out-Null
  Remove-Item "$Font.tar" -Force
}

if (-not (Extract-WithTar)) {
  Write-Host "tar failed, falling back to 7zip"
  Extract-With7Zip
}

Remove-Item $Archive -Force

Write-Host "Cleaning up extra variants (Mono/Propo/NL)..."

# Удаляем только variant-файлы, а не всё с 'Mono'
Get-ChildItem -File | Where-Object {
  $_.Extension -in @(".ttf", ".otf") -and (
    $_.Name -like "JetBrainsMonoNerdFontMono-*" -or
    $_.Name -like "JetBrainsMonoNerdFontPropo-*" -or
    $_.Name -like "JetBrainsMonoNLNerdFont*"
  )
} | Remove-Item -Force

Write-Host "Done. Remaining font files:"
Get-ChildItem -File | Where-Object { $_.Extension -in @(".ttf",".otf") } | Select-Object Name
Write-Host "Restart Windows Terminal / VS Code to apply the font."
