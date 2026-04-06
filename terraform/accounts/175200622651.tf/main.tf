terraform {
  backend "s3" {
    bucket = "terraform-backend-state-lk"
    key    = "terraform/state/terraform.tfstate"
    region = "us-east-1"
  } 
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region to deploy infrastructure"
}


module "ec2" {
  source = "../../modules/EC2"
  ami_id = "ami-07062e2a343acc423"
  instance_type = "t3.micro"
  region = var.region
  ami_name = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20260313"
  key_name1 = "terraform-ec2"
  key_name_prefix1 = "infra"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxzaMYf/TX2XpctGaSdqan1NHZerfvOXf7ssi9i4bW4hVRcNzfGrzTGC0u5lQQtGGVgiuq+bgeu9yPGA3rYyHra64lOvmxSICzWm5XSUxzfE67B4ovDrTK99d2cBh5n+PO+Q6Pg3P4FAYDU5krP2E3Uuvk8EohrhoT8i3T7iKHfqxP3rSZPS16OcEdr5ATYJ391wEkJXPnCh7ZEL4Owyl+wYTuIkS52WW8s700e2lTj313IU8iDHtQrnwTCWQQbrDTCELVT9AGtZjK6q4PEXh2P/BezsoNBoNP2qMlpDnFjwoMUTfA0pO1RY+S+Q8z3iV+lvQFEfUVq/kqNSLKV7Rzc7WXp/pFJbbRgCmxCnvo4xoY24Y5lQhOAR9pVR1Sl8hAoeOTX/Z3VTj3CIf3nkDKmwQmtoTe4TBkPUU3hewMaGybg64R3//Vkuig055I5OXAPBQkyvhDOQ6zcy1dAAzn3S4HZ3xw5Ue6blzdUAjQc2jmoq8YXRJdT90z89JSyKSeLuahuLX4dfvE/JghxL6x1PL9pbr66+rcejFnmUikJ3S5UqpC7AIlRviR/FL5+fsbVItvyQsXR9zhMwtKRAmg0bzGgfOG2l0bVcqv1g20aroVznsAvvOrSVx+yEndqXvSD8Z7OUeM4/D1ExAAdvIdRH5Ogd6stxCuL0h1wkracQ== your_email@example.com"
  security_group_name = "terraform_ec2_firewall"
}

output "security_group_data" {
  value = module.ec2.security_group_data
}

output "ami_data" {
  value = module.ec2.image_data
}