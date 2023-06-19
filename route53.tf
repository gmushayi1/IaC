# Create a Route 53 hosted zone
resource "aws_route53_zone" "route_53_zone" {
  name = "iac-sme-group-7.com."
  tags = merge(
    { Name = "iac-sme-group-7.com" },
    local.required_tags
  )
}