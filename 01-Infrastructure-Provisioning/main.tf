variable "access" {
  default = "mykey"
}
variable "secret" {
  default = "mykey"
}

module "terraform-aws-vpc-ec2" {
  source = "./terraform-aws-vpc-ec2"

access_key = "${var.access}"
secret_key = "${var.secret}"

}