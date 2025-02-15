# **🚀 Azure DevOps CI/CD Pipeline with Terraform, Docker, and Azure Pipelines**  

This project demonstrates a **fully automated CI/CD pipeline** using **Azure DevOps, Terraform, Docker, and Azure Pipelines** to deploy a **React application** on **Azure Container Instance (ACI)**.  

---

## **📌 Project Overview**  

✅ **Infrastructure as Code (IaC)** with **Terraform** to provision Azure resources  
✅ **Dockerized React App** for containerized deployment  
✅ **Azure Pipelines** for continuous integration and deployment  
✅ **Azure Container Registry (ACR)** for storing Docker images  
✅ **Azure Container Instance (ACI)** for hosting the application  
✅ **Automated deployment** on code push  

---

## **📂 Project Structure**  

```
AzureDevOps01/
│── 📁 Sample_app/               
│    ├── 📁 src/                 
│    ├── 📄 package.json         
│    ├── 📄 Dockerfile           
│    ├── 📄 .dockerignore        
│    ├── 📄 README.md            
│
│── 📁 infrastructure/           
│    ├── 📄 main.tf              
│    ├── 📄 variables.tf         
│    ├── 📄 outputs.tf           
│    ├── 📄 terraform.tfvars     
│    ├── 📄 README.md            
│
│── 📁 azure-pipelines/          
│    ├── 📄 azure-pipelines.yml  
│    ├── 📄 service-connection.md 
│               
│── 📄 README.md                 # Main Project Overview & Setup Guide
              
```

---

## **🚀 Deployment Flow**  

### **1️⃣ Infrastructure Setup with Terraform**  
🔹 Terraform provisions **Azure Container Registry (ACR)** and **Azure Container Instance (ACI)**  
🔹 Runs **terraform apply** to deploy resources  

### **2️⃣ Build and Push Docker Image**  
🔹 **Dockerfile** is used to build the image  
🔹 Image is pushed to **Azure Container Registry (ACR)**  

### **3️⃣ Deploy App via Azure Pipelines**  
🔹 **Pipeline triggers** on code push  
🔹 **Terraform applies infrastructure changes**  
🔹 **Docker image deploys to ACI**  

### **4️⃣ Live Deployment**  
🔹 The app is **accessible via a public URL**  

📌 **Live Deployment:**  
🔗 [http://abhinav-demo-project.eastus.azurecontainer.io](http://abhinav-demo-project.eastus.azurecontainer.io)  

---

## **📜 Key Files & Explanation**  

### **1️⃣ Sample React App (`Sample_app/`)**  
- **`package.json`** - Defines dependencies for the React app  
- **`Dockerfile`** - Instructions for building the React app Docker image  
- **`.dockerignore`** - Excludes unnecessary files from the Docker build  
- **`README.md`** - Guide for running the React app  

### **2️⃣ Terraform Configuration (`infrastructure/`)**  
- **`main.tf`** - Defines **ACI & ACR** infrastructure  
- **`variables.tf`** - Parameterized values for Terraform  
- **`outputs.tf`** - Stores important output values (like deployment URL)  
- **`terraform.tfvars`** - Stores actual values for Terraform variables  
- **`README.md`** - Guide for deploying the infrastructure  

### **3️⃣ Azure DevOps Pipeline (`azure-pipelines/`)**  
- **`azure-pipelines.yml`** - Defines the CI/CD pipeline  
- **`service-connection.md`** - Steps to set up service connections  

---

## **🔧 Setup Instructions**  

### **1️⃣ Clone the Project**  
```bash
git clone https://github.com/your-username/azure-devops-terraform-docker.git
cd azure-devops-terraform-docker
```

### **2️⃣ Terraform Setup**  
```bash
cd infrastructure
terraform init
terraform plan
terraform apply -auto-approve
```

### **3️⃣ Docker Build & Run Locally**  
```bash
cd Sample_app
docker build -t my-react-app .
docker run -p 3000:3000 my-react-app
```

### **4️⃣ Deploy via Azure DevOps**  
✔️ Push code to GitHub → **Pipeline triggers**  
✔️ **Terraform provisions resources**  
✔️ **Docker image builds & pushes to ACR**  
✔️ **App deploys to ACI**  

-
## **🤝 Contributing**  
Feel free to **open an issue or pull request** for improvements!  
