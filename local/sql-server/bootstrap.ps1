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

$sqlServerHost = if ($env:SQLSERVER_HOST) { $env:SQLSERVER_HOST } else { "ZETALAPTOP\SQLEXPRESS" }
$sqlServerDatabase = if ($env:SQLSERVER_DATABASE) { $env:SQLSERVER_DATABASE } else { "master" }
$sqlServerUser = $env:SQLSERVER_USER
$sqlServerPassword = $env:SQLSERVER_PASSWORD

Write-Host "=== EXECUTING RESTORE SQL - SQL SERVER DATABASE FOR COURSES ==="
foreach ($coursePath in $coursePaths) {
  $restoreScript = Join-Path $repoRoot "courses\$coursePath\datasets\sql-server\restore.sql"
  Write-Host "EXECUTING >>> $restoreScript"

  $sqlcmdArgs = @(
    "-S", $sqlServerHost,
    "-d", $sqlServerDatabase,
    "-N",
    "-C",
    "-i", $restoreScript
  )

  if ($sqlServerUser) {
    $sqlcmdArgs += @("-U", $sqlServerUser)
    if ($sqlServerPassword) {
      $sqlcmdArgs += @("-P", $sqlServerPassword)
    }
  }
  else {
    $sqlcmdArgs += @("-E")
  }

  & sqlcmd @sqlcmdArgs
  if ($LASTEXITCODE -ne 0) {
    throw "sqlcmd failed while executing $restoreScript"
  }
}