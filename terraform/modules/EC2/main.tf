
data "aws_ami" "terraform_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }
  owners = ["amazon"] # Canonical
}

resource "aws_instance" "terraform_ec2" {
  ami           = data.aws_ami.terraform_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-ec2-instance"
  }
}