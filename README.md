# Letschat Backend Terraform

This repository contains Terraform IaC for provisioning the backend
infrastructure of the LetsChat application across multiple environments:
**dev**, **qa**, and **prod**.

## 📂 Project Structure

    .
    ├── environments
    │   ├── dev
    │   ├── prod
    │   └── qa
    ├── modules
    │   ├── ecs
    │   ├── endpoints
    │   ├── iam
    │   ├── ns
    │   ├── service
    │   ├── sg
    │   ├── sm
    │   └── vpc
    └── tfvars

------------------------------------------------------------------------

## 🚀 Environments

Each environment (**dev**, **qa**, **prod**) includes:

-   `backend.hcl` --- Remote backend configuration
-   `backend.tf` --- S3 backend setup
-   `provider.tf` --- AWS provider config
-   `main.tf` --- Module compositions
-   `variables.tf` --- Input variables

------------------------------------------------------------------------

## 🧩 Modules

Reusable Terraform modules:

-   **vpc** --- VPC, subnets, gateways, routes\
-   **ecs** --- ECS cluster\
-   **service** --- ECS services + ALB/NLB\
-   **sg** --- Security groups\
-   **sm** --- Secrets Manager\
-   **iam** --- IAM roles and policies\
-   **endpoints** --- VPC Endpoints\
-   **ns** --- Cloud Map namespace

Each module contains:

-   `main.tf`
-   `outputs.tf`
-   `variables.tf`

------------------------------------------------------------------------

## 🛠 How to Use

### 1️⃣ Select Environment

    cd environments/dev

### 2️⃣ Initialize Terraform

    terraform init -backend-config=backend.hcl

### 3️⃣ Apply Using tfvars

    terraform apply -var-file="../../tfvars/dev.tfvars"

------------------------------------------------------------------------

## 🔐 Secrets Handling

Secrets are **not stored** in the repository.\
They are created using the **sm module** and fetched by ECS using ARNs.

------------------------------------------------------------------------

## 📦 CI/CD (Jenkins Ready)

This structure supports:

-   Per‑env pipeline execution
-   Automated plan/apply
-   Versioned backend
-   Modular deployments

------------------------------------------------------------------------

## 📑 Notes

-   All environments have isolated state files.
-   Modules are reusable and follow best practices.
-   No sensitive data is present in repo.

------------------------------------------------------------------------

