variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "ami_name" {
  type        = string
  default     = ""
  description = "Image for my ec2 instance"
}

variable "vpc" {
  type        = string
  default     = ""
  description = "vpc for my ec2 instance"
}

variable "subnet" {
  type        = string
  default     = ""
  description = "subnet for my ec2 instance"
}

variable "security_group" {
  type        = string
  default     = ""
  description = "security group for my ec2 instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type for my ec2 instance"
}

variable "ami_id" {
  type        = string
  default     = ""
  description = "AMI ID for my ec2 instance"
}

