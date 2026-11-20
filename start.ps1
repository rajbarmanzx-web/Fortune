# VERICRED Local Server Launcher
Set-Location -Path $PSScriptRoot
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  VERICRED: Verify Without Revealing (Web3 + ZKP)" -ForegroundColor Green
Write-Host "  Starting Server on http://localhost:3000..." -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

Start-Process "http://localhost:3000"
& "$PSScriptRoot\bin\node.exe" "$PSScriptRoot\server\index.js"
