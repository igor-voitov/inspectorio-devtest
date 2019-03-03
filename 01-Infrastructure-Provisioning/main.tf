variable "access_key" {
  default = "$AWS_ACCESS_KEY"
}
variable "secret_key" {
  default = "$AWS_SECRET_KEY"
}


module "terraform-aws-vpc-ec2" {
  source = "./terraform-aws-vpc-ec2"

access_key = "${var.access_key}"
secret_key = "${var.secret_key}"


}