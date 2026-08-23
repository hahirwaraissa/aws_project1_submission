# Helper script to activate the virtual environment and launch JupyterLab

if (-not (Test-Path ".venv")) {
    Write-Host "Creating virtual environment..." -ForegroundColor Cyan
    python -m venv .venv
}

Write-Host "Activating virtual environment..." -ForegroundColor Cyan
& .venv\Scripts\Activate.ps1

Write-Host "Starting JupyterLab..." -ForegroundColor Cyan
jupyter lab
