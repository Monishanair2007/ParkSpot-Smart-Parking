#!/bin/bash

# ParkSpot+ local startup script
# Starts the Node.js backend and React/Vite frontend.

set -e

echo "=========================================="
echo "🚀 ParkSpot+ Smart Parking System"
echo "=========================================="

cleanup() {
  echo
  echo "🛑 Stopping ParkSpot+..."
  if [ -n "${BACKEND_PID:-}" ]; then kill "$BACKEND_PID" 2>/dev/null || true; fi
  if [ -n "${FRONTEND_PID:-}" ]; then kill "$FRONTEND_PID" 2>/dev/null || true; fi
}
trap cleanup INT TERM EXIT

echo "📦 Installing backend dependencies..."
(cd backend && npm install)

echo "📡 Starting backend on http://localhost:3001..."
(cd backend && node index.js) &
BACKEND_PID=$!

echo "📦 Installing frontend dependencies..."
(cd frontend && npm install)

echo "💻 Starting frontend on http://localhost:5173..."
(cd frontend && npm run dev) &
FRONTEND_PID=$!

echo
echo "✅ ParkSpot+ is running."
echo "🌐 Frontend: http://localhost:5173"
echo "📡 Backend:  http://localhost:3001"
echo "💡 Press Ctrl+C to stop both services."

wait
