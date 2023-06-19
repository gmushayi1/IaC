# Save cluster name in Parameter store
resource "aws_ssm_parameter" "fargateClusterName" {
  name  = "/${local.team}/${var.environment}/deployments/lookup/fargateClusterName"
  type  = "String"
  value = aws_ecs_cluster.iac_sme_cluster.name
  tags = merge(
    local.required_tags,
  )
}