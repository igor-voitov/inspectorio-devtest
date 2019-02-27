variable "access_key" {}
variable "secret_key" {}


module "terraform-aws-vpc-ec2" {
  source = "./terraform-aws-vpc-ec2"

access_key = "${var.access_key}"
secret_key = "${var.secret_key}"


}