# Troubleshooting Minikube on Windows

This guide covers common issues encountered while setting up Minikube on Windows with the Docker driver.

## 1. Docker Desktop is not running

**Error example:**

```text
Docker Desktop is not running
```

**Fix:**

1. Open Docker Desktop.
2. Wait until Docker Desktop reports that it is running.
3. Verify Docker:

```powershell
docker --version
```

4. Start Minikube again:

```powershell
minikube start --driver=docker
```

## 2. WSL 2 is not installed

**Error examples:**

```text
WSL 2 installation is incomplete
```

or

```text
wsl: detected localhost proxy configuration
```

**Fix:**

Run PowerShell as Administrator:

```powershell
wsl --install
```

Restart your computer if prompted.

Check WSL:

```powershell
wsl --version
```

## 3. Hyper-V is not available

This can occur on Windows editions where Hyper-V is unavailable.

**Fix:**

Use the Docker driver instead of Hyper-V:

```powershell
minikube start --driver=docker
```

Do not use:

```powershell
minikube start --driver=hyperv
```

unless Hyper-V is available and enabled on your Windows edition.

## 4. kubectl is not recognised

**Error example:**

```text
kubectl : The term 'kubectl' is not recognized
```

**Fix:**

Install kubectl:

```powershell
winget install -e --id Kubernetes.kubectl
```

Close and reopen PowerShell, then verify:

```powershell
kubectl version --client
```

## 5. Minikube is not recognised

**Error example:**

```text
minikube : The term 'minikube' is not recognized
```

**Fix:**

Install Minikube:

```powershell
winget install Kubernetes.minikube
```

Close and reopen PowerShell, then verify:

```powershell
minikube version
```

## 6. Virtualisation is disabled

**Error example:**

```text
This computer doesn't have VT-X/AMD-v enabled
```

**Fix:**

1. Restart the computer.
2. Enter BIOS/UEFI, usually using `F2`, `Del`, `F10`, or `Esc`.
3. Enable **Intel VT-x**, **AMD-V**, or **SVM Mode**.
4. Save and restart.
5. Check Task Manager: **Performance → CPU → Virtualisation: Enabled**.

## 7. Cluster fails to start

Try removing the existing cluster and starting again:

```powershell
minikube delete
minikube start --driver=docker
```

If the issue continues, delete all Minikube profiles:

```powershell
minikube delete --all
minikube start --driver=docker
```

**Warning:** `minikube delete --all` deletes all Minikube profiles on the machine.

## 8. Multi-node cluster fails

Make sure Docker Desktop has enough resources.

Try starting with fewer nodes first:

```powershell
minikube start --driver=docker
```

Then create a multi-node cluster:

```powershell
minikube start --nodes=3 --driver=docker
```

Check nodes:

```powershell
kubectl get nodes
```

## 9. Check Minikube logs

If Minikube fails, run:

```powershell
minikube logs
```

Include the relevant error output when asking for help.
