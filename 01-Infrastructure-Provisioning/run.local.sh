

#bash
terraform init
terraform plan -out "planfile" -var "access=$AWS_ACCESS_KEY" -var "secret=$AWS_SECRET_KEY"
terraform apply "planfile"