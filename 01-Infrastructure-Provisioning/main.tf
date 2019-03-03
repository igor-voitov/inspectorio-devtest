variable "access" {
  default = "$AWS_ACCESS_KEY"
}
variable "secret" {
  default = "$AWS_SECRET_KEY"
}


module "terraform-aws-vpc-ec2" {
  source = "./terraform-aws-vpc-ec2"

access_key = "${var.access}"
secret_key = "${var.secret}"


}