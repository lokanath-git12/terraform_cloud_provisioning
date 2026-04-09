
data "aws_ami" "terraform_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }
  owners = ["amazon"] # Canonical
}

resource "aws_key_pair" "ec2_ssh_key_pair" {
  key_name   =  var.key_name1
  region     = var.region
  public_key = var.public_key
}

data "aws_security_group" "ec2_firewall" {
  name = var.security_group_name
}

resource "aws_instance" "terraform_ec2" {
  ami           = data.aws_ami.terraform_ami.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_ssh_key_pair.key_name
  security_groups  = [data.aws_security_group.ec2_firewall.name]
  tags = {
    Name = "terraform-ec2-instance"
  }
}