# Create an ECS cluster
resource "aws_ecs_cluster" "iac_sme_cluster" {
  name = var.ecs_cluster_prefix
  tags = merge(
    { Name = "${var.ecs_cluster_prefix}" },
    local.required_tags
  )
}



