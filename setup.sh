#!/bin/bash
echo "========================================"
echo "  BUCT-China iGEM 2025 Wiki - Setup"
echo "========================================"
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python3 not found! Please install Python 3.12+"
    exit 1
fi
echo "[OK] Python found"

# Create venv if not exists
if [ ! -f "venv/bin/python" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi
echo "[OK] Virtual environment ready"

# Install dependencies
echo "Installing dependencies..."
venv/bin/pip install Flask==3.1.3 Frozen-Flask==1.0.2 --quiet
echo "[OK] Dependencies installed"

# Start server
echo ""
echo "========================================"
echo "  Starting wiki at http://localhost:8080"
echo "  Press Ctrl+C to stop"
echo "========================================"
echo ""
venv/bin/python app.py