# #create an EC2 bastion host
# # Creates public bastion host
# resource "aws_instance" "bastion" {
#   ami                  = "ami-022e1a32d3f742bd8"
#   instance_type        = "t2.micro"
#   subnet_id            = data.aws_subnet.public_subnets[0].id
#   iam_instance_profile = aws_iam_instance_profile.bastion_profile.name
#   tags = merge(
#     { Name = "iac-sme-group-7-bastion-public" },
#     local.required_tags
#   )
# }

# # Creates private bastion host
# resource "aws_instance" "admin" {
#   ami                  = "ami-08c50cb06459e56a4"
#   instance_type        = "t2.micro"
#   subnet_id            = data.aws_subnet.public_subnets[0].id
#   iam_instance_profile = aws_iam_instance_profile.bastion_profile.name
#   tags = merge(
#     { Name = "iac-sme-group-7-admin-bastion" },
#     local.required_tags
#   )
# }
