#pwsh
terraform init
terraform plan -out "planfile" -var "access=$env:AWS_ACCESS_KEY" -var "secret=$env:AWS_SECRET_KEY"
terraform apply "planfile" 


#bash
terraform init
terraform plan -out "planfile" -var "access=$AWS_ACCESS_KEY" -var "secret=$AWS_SECRET_KEY"
terraform apply "planfile"