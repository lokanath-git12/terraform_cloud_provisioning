provider "aws" {
  foreach = var.region
}