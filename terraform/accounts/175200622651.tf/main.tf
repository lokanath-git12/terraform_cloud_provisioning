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
  default     = "us-east-1"
  description = "AWS region to deploy infrastructure"
}


module "ec2" {
  source = "../../modules/EC2"
  ami_id = "ami-0c3389a4fa5bddaad"
  instance_type = "t3.micro"
  region = var.region
  ami_name = "al2023-ami-2023.10.20260325.0-kernel-6.1-x86_64"
}

output "ami_name" {
  value = module.ec2.image_name
}

output "ami_id" {
  value= module.ec2.image_id
}

output "ami_data" {
  value = module.ec2.image_data
}

