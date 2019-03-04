# Overview
This repo contains sample automation scenario based on **`Terraform`**, **`Python`** API app (utilizing `Connexion` spec-first framework based on **`Flask`**), `Docker`, `Azure Container Registry` / `Docker Hub` as image repo, **`Kubernetes`** as deployment target/platform, **`Helm charts`** as packaging approach, `Azure Container Registry` as Helm charts repo.
**`GitLab`** CI/CD utilized for automation.

Sample deployment on `Azure Kubernetes Service`: [SwaggerUI](http://40.68.206.101/ui/)


# Qucik start (GitLab CI)

### Prerequesites
In the GitLab UI, navigate to Settings > CI/CD and expand the Variables section

Add 3 variables:
```
AWS_ACCOUNT_ID
AWS_ACCESS_KEY
AWS_SECRET_KEY
```
### Pipeline: Terraform provisioning
This pipeline will provision EC2 and VPC, you should manually confirm `apply` stage to actully apply TF configuration

Pipeline will export artifact which containing your private_key.pem key to connect to EC2 instance




# Quick start (manually)

## 01-Infrastructure-Provisioning
This folder contains `Terraform` module which provisions EC2 instance in separate VPCfor AWS provider.
AWS access key ID and secret access key required for AWS auth.
Terraform configuration organized as module in `terraform-aws-vpc-ec2` 
Module generates both public and private keys to connect to your EC2 instance

### Prerequesites:
- Terraform binary avaliable in path (was tested on Terraform v0.11.11)
- AWS access key and secret access key
- Environment variables:

```bash
  export AWS_ACCESS_KEY=yourkey #coment
  export AWS_SECRET_KEY=yourkey
```
### How-to:

To apply configuration from within your local environment, please execute the following from the /01-Infrastructure-Provisioning directory:
```bash
  terraform init
  terraform plan -out "planfile" -var "access=$AWS_ACCESS_KEY" -var "secret=$AWS_SECRET_KEY"
  terraform apply "planfile"
```


## 02-Coding-skills-swagger

### Prerequesites:
- Docker 

### How-to:

To run the server on a local Docker container, please execute the following from the /02-Coding-skills-swagger directory:

```bash
  # building the image
  docker build -t swagger_server:latest .

  docker run \
  -e AWS_ACCOUNT_ID=myAWSacc \
  -e AWS_ACCESS_KEY=myAWSaccesskey \
  -e AWS_SECRET_KEY=myAWSsecretkey \
  --name=swagger-server -it --rm -p 8080:8080 swagger_server:latest
```

## 03-Kubernetes-templating-with-helm

### Prerequesites:
- Estabilished connection to Kubernetes cluster, configuration avaliable under $HOME/.kube
- Kubectl 
- Tiller installed in your cluster, estabilished connction from Helm to Tiller
- Helm

To install from local folder, execute the following from the folder root directory: 

```bash
  helm install aws-checker --name aws-checker --wait
  kubectl get svc load-balancer
```



