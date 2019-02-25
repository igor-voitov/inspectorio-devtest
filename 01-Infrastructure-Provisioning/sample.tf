variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-0eaec5838478eb0ba"
}




# VPC
resource "aws_vpc" "inspectoriovpc" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true

}


# security group
resource "aws_security_group" "sgweb" {
  name = "vpc_test_web"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  vpc_id="inspectoriovpc"

  
}


resource "aws_instance" "VM" {
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("install.sh")}"

}


