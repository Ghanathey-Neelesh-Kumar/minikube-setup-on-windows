# Docker Desktop must be running before executing this script.

Write-Host "Setting Docker as the default Minikube driver..."
minikube config set driver docker

Write-Host "Starting Minikube..."
minikube start --driver=docker

Write-Host "Checking Minikube status..."
minikube status

Write-Host "Checking Kubernetes nodes..."
kubectl get nodes

Write-Host "Checking all pods..."
kubectl get pods -A
