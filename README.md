# Overview
This repo contains sample automation scenario based on **`Terraform`**, **`Python`** API app (utilizing `Connexion` spec-first framework based on **`Flask`**), `Docker`, `Azure Container Registry` / `Docker Hub` as image repo, **`Kubernetes`** as deployment target/platform, **`Helm charts`** as packaging approach, `Azure Container Registry` as Helm charts repo.
**`GitLab`** CI/CD utilized for automation.

Sample deployment on `Azure Kubernetes Service`: [SwaggerUI](http://40.68.206.101/ui/)

# Quick start (manually)

## 01-Infrastructure-Provisioning
This folder contains `Terraform` module which provisions EC2 instance in separate VPCfor AWS provider.
AWS access key ID and secret access key required for AWS auth.
Terraform configuration organized as module in `terraform-aws-vpc-ec2` 
Module generates both public and private keys to connect to your EC2 instance

### Prerequesites:
- Terraform binary avaliable in path, tested on Terraform v0.11.11
- AWS account, AWS access key ID and secret access key
- AWS access key ID and secret access key in Environment variables:

```bash
  export AWS_ACCESS_KEY=yourkey #coment
  export AWS_SECRET_KEY=yourkey
```
### How-to:
```bash
  terraform init
  terraform plan -out "planfile" -var "access=$AWS_ACCESS_KEY" -var "secret=$AWS_SECRET_KEY"
```


## 02-Coding-skills-swagger

## 03-Kubernetes-templating-with-helm



# Qucik start (GitLab CI)
In the GitLab UI, navigate to Settings > CI/CD and expand the Variables section
Create 3 variables:
AWS_ACCOUNT_ID
AWS_ACCESS_KEY
AWS_SECRET_KEY
