data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's owner ID for AWS
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "prod_vpc" {
  tags = {
    "Env" = "Prod"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "azs" {
  value = data.aws_availability_zones.available.names
}

output "prod_vpc" {
  value = data.aws_vpc.prod_vpc.id 
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current.id
}
output "aws_region" {
  value = data.aws_region.current
}

resource "aws_instance" "web" {
  # us-west-2	Questing Quokka - ami-0ab257011825e9ff9
  # ami-0814047988c3d86eb
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
}
