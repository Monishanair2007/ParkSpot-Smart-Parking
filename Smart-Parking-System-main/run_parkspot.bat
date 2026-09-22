@echo off
echo ==========================================
echo ParkSpot+ Smart Parking System
echo ==========================================

echo.
echo Starting backend on http://localhost:3001...
start "ParkSpot Backend" cmd /k "cd /d %~dp0backend && npm install && node index.js"

echo Starting frontend on http://localhost:5173...
start "ParkSpot Frontend" cmd /k "cd /d %~dp0frontend && npm install && npm run dev"

echo.
echo Two terminal windows have been opened.
echo Frontend: http://localhost:5173
echo Backend:  http://localhost:3001
echo.
pause
