#pwsh
# 
# $env:AWS_ACCESS_KEY = "myawsaccesskey"
# $env:AWS_SECRET_KEY = "myawssecretkey"
terraform init
terraform plan -out "planfile" -var "access=$env:AWS_ACCESS_KEY" -var "secret=$env:AWS_SECRET_KEY"
terraform apply "planfile" 
