# Minikube Setup on Windows (Docker Driver)

This repository provides step-by-step instructions to install and run a local Kubernetes cluster using **Minikube** on Windows with the **Docker driver**.

It is designed for beginners using Windows 10 or Windows 11.

## Video tutorial

Follow the video walkthrough: [Minikube Setup on Windows](https://www.youtube.com/watch?v=z4fbuRDD4n4&t=599s).

## What you will set up

- WSL 2 on Windows
- Docker Desktop
- Minikube
- kubectl
- A local single-node Kubernetes cluster
- Optionally, a multi-node Kubernetes cluster

## Prerequisites

Before starting, ensure that:

- You are using Windows 10 or Windows 11
- Virtualisation is enabled in BIOS/UEFI
- You have administrator access
- Docker Desktop is installed and running
- PowerShell is opened as Administrator when installing Windows components

### Check virtualisation

Open **Task Manager** using `Ctrl + Shift + Esc`.

Go to **Performance → CPU** and check that **Virtualisation** says **Enabled**.

If it is disabled, restart your computer, enter BIOS/UEFI using `F2`, `Del`, or the manufacturer-specific key, and enable virtualisation.

## Step 1: Install WSL 2

Open **PowerShell as Administrator** and run:

```powershell
wsl --install
```

Check the installed WSL version:

```powershell
wsl --version
```

Restart your computer if prompted.

## Step 2: Install Docker Desktop

Download Docker Desktop:

https://www.docker.com/products/docker-desktop/

After installation:

1. Start Docker Desktop.
2. Wait until Docker is running.
3. Verify the installation:

```powershell
docker --version
```

Docker Desktop must be running before you start Minikube.

## Step 3: Install Minikube

Install Minikube using Windows Package Manager:

```powershell
winget install Kubernetes.minikube
```

Verify the installation:

```powershell
minikube version
```

## Step 4: Install kubectl

Install kubectl using Windows Package Manager:

```powershell
winget install -e --id Kubernetes.kubectl
```

Verify kubectl:

```powershell
kubectl version --client
```

## Step 5: Start Minikube with Docker driver

Make sure Docker Desktop is running, then start Minikube:

```powershell
minikube start --driver=docker
```

To set Docker as the default Minikube driver:

```powershell
minikube config set driver docker
```

## Step 6: Verify the cluster

Check Minikube status:

```powershell
minikube status
```

Check cluster information:

```powershell
kubectl cluster-info
```

List nodes:

```powershell
kubectl get nodes
```

List all pods across all namespaces:

```powershell
kubectl get pods -A
```

A successful single-node cluster should show a node named:

```text
minikube
```

## Common Minikube commands

Start Minikube:

```powershell
minikube start --driver=docker
```

Stop Minikube:

```powershell
minikube stop
```

Delete the Minikube cluster:

```powershell
minikube delete
```

Delete all Minikube profiles:

```powershell
minikube delete --all
```

Pause Minikube:

```powershell
minikube pause
```

Resume Minikube:

```powershell
minikube unpause
```

## Create a multi-node cluster

By default, Minikube creates one node that acts as both the control plane and worker node.

To create a three-node cluster:

```powershell
minikube start --nodes=3 --driver=docker
```

Verify the nodes:

```powershell
kubectl get nodes
```

You should see output similar to:

```text
NAME           STATUS   ROLES           AGE   VERSION
minikube       Ready    control-plane   ...   ...
minikube-m02   Ready    <none>          ...   ...
minikube-m03   Ready    <none>          ...   ...
```

## Official documentation

- Minikube documentation: https://minikube.sigs.k8s.io/docs/start/
- Docker Desktop: https://www.docker.com/products/docker-desktop/
- kubectl installation for Windows: https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/

## Troubleshooting

See [docs/troubleshooting.md](docs/troubleshooting.md) for common Windows issues and fixes.

## Repository scripts

Optional PowerShell scripts are provided in the [`scripts/`](scripts/) directory. Review each script before running it, and run installation scripts from an elevated PowerShell session where required.
