# Create a Route 53 hosted zone
resource "aws_route53_zone" "route_53_zone" {
  name = var.zone_name
  tags = merge(
    { Name = "${var.zone_name}" },
    local.required_tags
  )
}