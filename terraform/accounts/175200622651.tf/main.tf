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

module ec2 {
  source = "../../modules/EC2"
}

output "ami_name" {
  value = module.ec2.marketplace_ami
}