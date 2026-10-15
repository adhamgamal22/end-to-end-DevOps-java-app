
 # 🚀 End-to-End DevOps Java Application

An end-to-end DevOps project featuring a Java Spring Boot application automated with a **Multibranch CI/CD Pipeline** using **Jenkins**, containerized with **Docker**, and deployed on **Kubernetes (k8s)**.

---

## 🛠️ Tech Stack & Tools
    
* **Application:** Java 17 / Spring Boot, Maven
* **CI/CD Automation:** Jenkins (Multibranch Pipeline)
* **Code Quality:** SonarQube
* **Containerization:** Docker & Docker Hub
* **Orchestration:** Kubernetes (Deployments, Pods, Services)
* **Package Management:** Helm
* **Version Control:** Git & GitHub

---

## 🏗️ Architecture & Pipeline Flow

[ Git Push (main/test) ]
│
▼
[ Jenkins Multibranch Pipeline ]
│
├──► 1. Checkout Code
├──► 2. Build & Test (Maven)
├──► 3. Code Quality Scan (SonarQube)
├──► 4. Docker Build & Push (Docker Hub)
└──► 5. Kubernetes Deployment (kubectl / Helm)


---

## 🚀 Branching Strategy

| Branch | Purpose | Deployment Target |
| :--- | :--- | :--- |
| `main` | Production-ready code | Default / Production K8s Namespace |
| `test` | Staging & Testing features | Staging / Test K8s Namespace |

---

## 📋 Kubernetes Configuration

The application runs inside a Kubernetes cluster with high availability:
* **Deployment:** 4 Replicas for resilience and load handling.
* **Service:** Exposes the application pods internally and externally.

---

## 🚦 Quick Start (Local Setup)

### Prerequisites
* Java 17+ & Maven
* Docker Desktop / Engine
* Minikube or Kubernetes cluster (`kubectl` configured)

### Run Locally with Docker
```bash
# Build Docker image
docker build -t adhamgamal/end-to-end-devops-java-app:latest .

# Run Container
docker run -d -p 8080:8080 adhamgamal/end-to-end-devops-java-app:latest
Deploy to Kubernetes
Bash
# Apply Kubernetes Manifests
kubectl apply -f deploy.yml
kubectl apply -f service.yml

# Verify Pods Status
kubectl get pods
```

---

## 👤 Author & Connect

<div align="center">

### **Adham Gamal**
**Java Backend Developer & DevOps Engineer**

  [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/adhamgamal74/)

---
*Building scalable backend systems & automated CI/CD cloud solutions.*

</div>
