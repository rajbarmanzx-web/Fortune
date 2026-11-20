@echo off
title VERICRED Full-Stack Platform
cd /d "%~dp0"
echo ============================================================
echo   VERICRED: Verify Without Revealing (Web3 + ZKP)
echo   Starting High-Performance Server on http://localhost:3000
echo ============================================================
start "" "http://localhost:3000"
.\bin\node.exe server\index.js
pause
