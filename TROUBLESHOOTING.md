# 🔧 Troubleshooting Guide

Common errors you may encounter when installing Minikube on Windows, and exactly how to fix them.

---

## ❌ Error: Hyper-V PowerShell Module is not available

```
X Exiting due to PR_HYPERV_MODULE_NOT_INSTALLED: Failed to start host
```

**Cause:** You are on Windows Home, which does not support Hyper-V.

**Fix:** Use the Docker driver instead.

```powershell
minikube delete --all
minikube start --driver=docker
```

To make Docker the permanent default:

```powershell
minikube config set driver docker
```

---

## ❌ Error: Docker Desktop not running / Docker is not running

```
X Exiting due to PROVIDER_DOCKER_NOT_RUNNING
```

**Cause:** Docker Desktop is installed but not started.

**Fix:**
1. Open Docker Desktop from the Start Menu
2. Wait for the 🐳 whale icon to appear in the system tray and show "Docker Desktop is running"
3. Run `minikube start --driver=docker` again

---

## ❌ Error: minikube start hangs or times out

**Cause:** A previous broken cluster state is interfering.

**Fix:** Delete all clusters and start fresh.

```powershell
minikube delete --all --purge
minikube start --driver=docker
```

---

## ❌ Error: kubectl not recognized

```
kubectl : The term 'kubectl' is not recognized
```

**Cause:** kubectl is not installed or not on your PATH.

**Fix:**

```powershell
winget install Kubernetes.kubectl
```

Then **restart PowerShell** and try again.

---

## ❌ Error: WSL 2 not installed

```
A required feature is not installed
```

**Cause:** Docker Desktop requires WSL 2 on Windows Home.

**Fix:** Run this in PowerShell as Administrator:

```powershell
wsl --install
```

Restart your PC, then relaunch Docker Desktop.

---

## ❌ Error: minikube status shows "Stopped" or "Nonexistent"

**Fix:** Simply start the cluster:

```powershell
minikube start --driver=docker
```

If it fails, do a clean reset:

```powershell
minikube delete --all
minikube start --driver=docker
```

---

## ❌ Error: Cannot connect to the Docker daemon

```
error during connect: Get http://%2F%2F.%2Fpipe%2Fdocker_engine/...
```

**Cause:** Docker Desktop is not running or the daemon crashed.

**Fix:**
1. Restart Docker Desktop
2. If it still fails, restart your PC
3. Make sure **"Use the WSL 2 based engine"** is enabled in Docker Desktop Settings → General

---

## ❌ Error: Insufficient memory or CPU

```
X Exiting due to MK_USAGE: ...
```

**Fix:** Increase resources allocated to Docker Desktop:

1. Open Docker Desktop → Settings → Resources
2. Increase CPU (minimum 2) and Memory (minimum 4GB)
3. Click **Apply & Restart**
4. Run `minikube start --driver=docker` again

---

## ❌ Error: Feature name Microsoft-Hyper-V-Tools-All is unknown

```
Enable-WindowsOptionalFeature : Feature name Microsoft-Hyper-V-Tools-All is unknown.
```

**Cause:** You are on Windows Home. Hyper-V features do not exist on this edition.

**Fix:** Skip Hyper-V entirely and use Docker:

```powershell
minikube config set driver docker
minikube start
```

---

## 💡 General Tips

- Always run PowerShell **as Administrator** when installing or configuring minikube
- Make sure Docker Desktop is **fully started** (not just launched) before running `minikube start`
- After a system restart, you must restart Docker Desktop and run `minikube start` again
- Use `minikube logs` to get detailed logs if minikube fails to start

---

## 🆘 Still stuck?

- [minikube GitHub Issues](https://github.com/kubernetes/minikube/issues)
- [minikube Official Docs](https://minikube.sigs.k8s.io/docs/)
- Leave a comment on the YouTube video
