data "aws_ami" "marketplace_ami" {
  most_recent = true

  owners = ["aws-marketplace", "amazon"]
  region = "us-east-1"

  filter {
    name   = "image-id"
    values = ["ami-099b5eec69f378993"]
  }
}

# output "ami_ids" {
#   value = data.aws_ami.marketplace_ami.id
# }

# data "aws_ami_ids" "ubuntu" {
#   owners = ["aws-marketplace"]
#   region = "us-east-1" 

#     filter {
#         name = "image-id"
#         values = ["ami-0c3389a4fa5bddaad","ami-0cb5cf49019e79c51"]
#     }
# }

# output "ami_ids" {
#     value = data.aws_ami_ids.ubuntu.ids
# }


# data "aws_ami_ids" "selected" {
#   # ⚠️ Optional: only include if you are sure about owner
#   owners = ["amazon"]

#   filter {
#     name = "image-id"
#     values = ["ami-0ce90cf162d6a0f8c"]
#   }
# }

output "marketplace_ami" {
  value = data.aws_ami.marketplace_ami
}