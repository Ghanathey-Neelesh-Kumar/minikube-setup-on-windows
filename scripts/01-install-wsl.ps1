# Run PowerShell as Administrator before executing this script.

Write-Host "Installing WSL 2..."
wsl --install

Write-Host "Checking WSL version..."
wsl --version

Write-Host "If prompted, restart your computer before continuing."
