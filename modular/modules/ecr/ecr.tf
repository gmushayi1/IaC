# Create an ECR repository
resource "aws_ecr_repository" "iac_sme_repo" {
  count = length(var.ecr-repo)
  name  = var.ecr-repo[count.index]
  tags = merge(
    { Name = "${var.ecr_name_prefix}" },
    local.required_tags
  )
}