# 🚀 **Azure DevOps Pipeline - Build & Deploy React Todo App**  

This repository contains an **Azure DevOps pipeline (`azure-pipelines.yml`)** to automate the **build, push, and deployment** of a Dockerized React Todo App using **Azure Container Registry (ACR)** and **Azure Container Instance (ACI)**.  

---

## 📌 **Pipeline Workflow**  

1️⃣ **Trigger**: Runs automatically when changes are pushed to the `main` branch.  
2️⃣ **Build**: Creates a Docker image of the React Todo App.  
3️⃣ **Push to ACR**: Pushes the image to **Azure Container Registry (ACR)**.  
4️⃣ **Deploy to ACI**: Deploys the container from ACR to **Azure Container Instance (ACI)**.  
5️⃣ **Expose App**: Makes the application accessible via a public DNS.  

---

## 🔧 **Pipeline Configuration (`azure-pipelines.yml`)**  

| Parameter                     | Description |
|--------------------------------|------------|
| `dockerRegistryServiceConnection` | Service connection ID for ACR authentication |
| `imageRepository`              | Name of the Docker image repository |
| `containerRegistry`            | ACR URL where the image will be pushed |
| `dockerfilePath`               | Path to the `Dockerfile` |
| `tag`                          | Build ID used as the Docker image tag |
| `vmImageName`                  | Virtual machine image used in Azure DevOps |
| `dns-name-label`               | Public DNS label assigned to the ACI instance |
| `cpu`, `memory`                | Resources allocated to the container |

---

## 📂 **Pipeline Stages**  

### 1️⃣ **Build & Push Docker Image**  
- Logs in to **Azure Container Registry (ACR)**.  
- Builds the **React Todo App Docker image**.  
- Tags the image using the **Build ID**.  
- Pushes the image to **ACR**.  

### 2️⃣ **Deploy to Azure Container Instance (ACI)**  
- Creates a container instance from the pushed image.  
- Assigns a **public DNS name** for accessibility.  

---

## 🚀 **How to Use This Pipeline**  

### ✅ **1. Set Up Azure Resources**  
Create an Azure **Container Registry (ACR)**:  
```bash
az acr create --resource-group <your-resource-group> --name <your-acr-name> --sku Basic
```

### ✅ **2. Configure Azure DevOps**  
1. **Set Up a Service Connection**:  
   - Navigate to **Azure DevOps → Project Settings → Service Connections**.  
   - Create a new **Azure Container Registry** connection.  
   - Copy the **service connection ID** and update `azure-pipelines.yml`.  

2. **Run the Pipeline**:  
   - Go to **Azure DevOps → Pipelines → New Pipeline**.  
   - Select **"Existing YAML file"** and choose `azure-pipelines.yml`.  
   - Click **Run**.  

### ✅ 3. Access the Deployed App

Find the public DNS URL after deployment:

az container show --name Containerpracticeproject --resource-group container01 --query ipAddress.fqdn --output tsv

🔗 Open the application in your browser:

http://abhinav-demo-project.eastus.azurecontainer.io

(Replace abhinav-demo-project.eastus.azurecontainer.io with your actual DNS label.)
Open it in your browser to access the app! 🌍  

---



## 📌 **Best Practices**  
✅ Store **ACR credentials securely** using **Azure Key Vault**.  
✅ Use **Role-Based Access Control (RBAC)** for security.  
✅ Enable **logging & monitoring** via **Azure Monitor**.  

---

This pipeline simplifies **CI/CD for React Apps** in **Azure**! 🚀  
For any improvements, feel free to contribute! 😊