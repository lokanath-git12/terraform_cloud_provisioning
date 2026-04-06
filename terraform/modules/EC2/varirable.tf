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

variable "public_key" {
  type        = string
  default     = ""
  description = "public key for my ec2 instance"
}

variable "key_name1" {
  type        = string
  default     = ""
  description = "private key for my ec2 instance"
}

variable "key_name_prefix1" {
  type        = string
  default     = ""
  description = "description for my ec2 instance keypair prefix"
}

variable "security_group_name" {
  type        = string
  default     = ""
  description = "security group name for my ec2 instance"
}




