output "image_name" {
  value = data.aws_ami.terraform_ami.name
}

output "image_id" {
  value = data.aws_ami.terraform_ami.id
}

output  "image_data" {
    value = data.aws_ami.terraform_ami
}
