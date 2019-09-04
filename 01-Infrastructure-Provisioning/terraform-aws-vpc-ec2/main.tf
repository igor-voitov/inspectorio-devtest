#providers
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

#resources
resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_vpc}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.cidr_subnet}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.availability_zone}"
  tags = {
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    "Environment" = "${var.environment_tag}"
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = "${aws_subnet.subnet_public.id}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}

resource "aws_security_group" "sg" {
  name = "sg"
  vpc_id = "${aws_vpc.vpc.id}"

  # SSH access from the VPC and other
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

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

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Environment" = "${var.environment_tag}"
  }
}

# automatically generating private/public keys
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# to store private key to file
resource "local_file" "pivate_key" {
  content  = "${tls_private_key.example.private_key_pem}"
  filename = "private_key.pem"
}

# to publish public key to VM
resource "aws_key_pair" "generated_public_key" {
  key_name   = "public_key"
  public_key = "${tls_private_key.example.public_key_openssh}"
}

# VM 
resource "aws_instance" "testInstance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.subnet_public.id}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  key_name = "${aws_key_pair.generated_public_key.key_name}"

  # setup python modules
  provisioner "remote-exec" {
        inline = [
        "sudo yum install -y python-pip python-wheel",
        "sudo yum upgrade -y python-setuptools",
        "sudo yum groupinstall -y \"Development Tools\"",
        "sudo yum install -y python-devel",
        "pip install --user awscli python-vim python-nginx uwsgi pipenv"
        ]
    connection {
        type        = "ssh"
        host        = "${aws_instance.testInstance.public_ip}"
        user        = "ec2-user"
        private_key = "${tls_private_key.example.private_key_pem}"
    }
  }
  tags = {
        "Environment" = "${var.environment_tag}"
    }
}










