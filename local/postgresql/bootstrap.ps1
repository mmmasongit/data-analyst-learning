$coursePaths = @(
  "udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero"
)

function Import-EnvFile {
  param(
    [string]$Path
  )

  if (-not (Test-Path $Path)) {
    return
  }

  Get-Content $Path | ForEach-Object {
    $line = $_.Trim()
    if (-not $line -or $line.StartsWith('#')) {
      return
    }

    $parts = $line.Split('=', 2)
    if ($parts.Count -ne 2) {
      return
    }

    $name = $parts[0].Trim()
    $value = $parts[1].Trim().Trim('"').Trim("'")

    if (-not [string]::IsNullOrWhiteSpace($name) -and -not [Environment]::GetEnvironmentVariable($name)) {
      [System.Environment]::SetEnvironmentVariable($name, $value)
    }
  }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
Import-EnvFile (Join-Path $repoRoot ".env")

$postgresDb = if ($env:POSTGRES_DB) { $env:POSTGRES_DB } else { "postgres" }
$postgresUser = if ($env:POSTGRES_USER) { $env:POSTGRES_USER } else { "postgres" }

if (-not $env:PGPASSWORD) {
  if ($env:POSTGRES_PASSWORD) {
    $env:PGPASSWORD = $env:POSTGRES_PASSWORD
  }
}

if (-not $env:PGPASSWORD) {
  $env:PGPASSWORD = Read-Host "Enter PostgreSQL password for user '$postgresUser'"
}

Write-Host "=== EXECUTING RESTORE SQL - POSTGRES DATABASE FOR COURSES ==="
foreach ($coursePath in $coursePaths) {
  $restoreScript = Join-Path $repoRoot "courses\$coursePath\datasets\postgresql\restore.sql"
  Write-Host "EXECUTING >>> $restoreScript"
  & psql -U $postgresUser -d $postgresDb -f $restoreScript
}$coursePaths = @(
  "udemy_the_complete_sql_bootcamp_30_hours_go_from_zero_to_hero"
)

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$postgresDb = "postgres"
$postgresUser = "postgres"

if (-not $env:PGPASSWORD) {
  $env:PGPASSWORD = Read-Host "Enter PostgreSQL password for user '$postgresUser'"
}

Write-Host "=== EXECUTING RESTORE SQL - POSTGRES DATABASE FOR COURSES ==="
foreach ($coursePath in $coursePaths) {
  $restoreScript = Join-Path $repoRoot "courses\$coursePath\datasets\postgresql\restore.sql"
  Write-Host "EXECUTING >>> $restoreScript"
  & psql -U $postgresUser -d $postgresDb -f $restoreScript
}