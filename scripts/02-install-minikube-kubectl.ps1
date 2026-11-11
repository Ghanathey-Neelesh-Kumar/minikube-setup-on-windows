# Run PowerShell as Administrator before executing this script.

Write-Host "Installing Minikube..."
winget install Kubernetes.minikube

Write-Host "Installing kubectl..."
winget install -e --id Kubernetes.kubectl

Write-Host "Verify installations after reopening PowerShell:"
Write-Host "minikube version"
Write-Host "kubectl version --client"
