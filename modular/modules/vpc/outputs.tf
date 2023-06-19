# Save VPC Id in Parameter store
resource "aws_ssm_parameter" "vpcId" {
  name  = "/${local.team}/${var.environment}/deployments/lookup/vpcId"
  type  = "String"
  value = aws_vpc.vpc.id
  tags = merge(
    local.required_tags,
  )
}
