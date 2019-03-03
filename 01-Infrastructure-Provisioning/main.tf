variable "AWS_ACCESS_KEY" {
  default = "$AWS_ACCESS_KEY"
}
variable "AWS_SECRET_KEY" {
  default = "$AWS_SECRET_KEY"
}


module "terraform-aws-vpc-ec2" {
  source = "./terraform-aws-vpc-ec2"

access_key = "${var.AWS_ACCESS_KEY}"
secret_key = "${var.AWS_SECRET_KEY}"


}