terraform {
  backend "s3" {
    bucket = "terraform-backend-state-lk"
    key    = "terraform/state/terraform.tfstate"
    region = "us-east-1"
  }
}
