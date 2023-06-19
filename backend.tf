# backend config
terraform {
  backend "s3" {
    bucket         = "iac-sme-group-7-terraform-state-backend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}

# S3 bucket
# resource "aws_s3_bucket" "s3-bucket" {
#     bucket = "iac-sme-group-7-terraform-state-backend"
#     versioning {
#         enabled = true
#     }
#     server_side_encryption_configuration {
#         rule {
#             apply_server_side_encryption_by_default {
#                 sse_algorithm = "AES256"
#             }
#         }
#     }
#     object_lock_configuration {
#         object_lock_enabled = "Enabled"
#     }
#     tags = merge(local.required_tags,{
#         Name = "iac-sme-group-7-terraform-state-s3-backend"
#     })
# }

# ddb state locking table
resource "aws_dynamodb_table" "iac-sme-group-7-terraform-lock" {
  name           = "iac-sme-group-7-terraform-lock-ddb"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(
    { Name = "iac-sme-group-7-terraform-lock-ddb-table" },
    local.required_tags
  )
}