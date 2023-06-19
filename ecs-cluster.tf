# Create an ECS cluster
resource "aws_ecs_cluster" "iac_sme_cluster" {
  name = "iac-sme-group-7-cluster"
  tags = merge(
    { Name = "iac-sme-group-7-cluster" },
    local.required_tags
  )
}

# Save cluster name in Parameter store
resource "aws_ssm_parameter" "fargateClusterName" {
  name  = "/${local.team}/${var.environment}/deployments/lookup/fargateClusterName"
  type  = "String"
  value = aws_ecs_cluster.iac_sme_cluster.name
  tags = merge(
    local.required_tags,
  )
}