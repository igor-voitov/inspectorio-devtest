# Overview
This repo contains sample automation scenario based on `Terraform`, `Python` API app (utilizing `Connexion` spec-first framework ), `Docker`, `Azure Container Registry` / `Docker Hub` as image repo, `Kubernetes` as deployment target/platform, `Helm chart` as packaging approach, `Azure Container Registry` as Helm charts repo.
`GitLab` CI/CD utilized for automation.
You can find each phase under corresponsing folder.

Browse to sample deployment on `Azure Kubernetes Service`:

[SwaggerUI](http://40.68.206.101/ui/)

# Quick start (manually)

## 01-Infrastructure-Provisioning
This folder contains `Terraform` module which provisions EC2 instance in separate VPCfor AWS provider.
AWS access key ID and secret access key required for AWS auth.
EC2

### Prerequesites:
- Terraform binary avaliable in path, tested on Terraform v0.11.11
- AWS account, AWS access key ID and secret access key
- AWS access key ID and secret access key in Environment variables:

```bash
  export AWS_ACCESS_KEY=yourkey
  export AWS_SECRET_KEY=yourkey
```

## 02-Coding-skills-swagger

## 03-Kubernetes-templating-with-helm



# Qucik start (GitLab CI)
In the GitLab UI, navigate to Settings > CI/CD and expand the Variables section
Create 3 variables:
AWS_ACCOUNT_ID
AWS_ACCESS_KEY
AWS_SECRET_KEY
