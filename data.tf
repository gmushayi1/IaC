data "aws_region" "current" {

}

data "aws_caller_identity" "current" {
}

data "aws_availability_zones" "available-azs" {
  state = "available"
}

# subnets selection data source
# data "aws_subnet_ids" "all_subnets" {
#   vpc_id = aws_vpc.vpc.id
# }

#   data "aws_subnets" "private_subnets" {
#   tags = {
#   Name = "iac-sme-group-7-private-subnet-private-*"
#   }
# }

#   data "aws_subnets" "public_subnets" {
#   tags = {
#   Name = "iac-sme-group-7-public-subnet-public-*"
#   }
# }


# public subnet data sources
data "aws_subnet" "public_subnets" {
  for_each = toset(data.aws_subnet_ids.all_subnets.ids)
  id       = each.value
  #   count = length(data.aws_subnet_ids.all_subnets.ids)
  #   id    = data.aws_subnet_ids.all_subnets.ids[count.index]
  filter  {
  name = "tag:name"
  values= ["iac-sme-group-7-public-subnet-public-*"]
    }

  }




# private subnet data sources
data "aws_subnet" "private_subnets" {
  for_each = toset(data.aws_subnet_ids.all_subnets.ids)
  id       = each.value
  #   count = length(data.aws_subnet_ids.all_subnets.ids)
  #   id    = data.aws_subnet_ids.all_subnets.ids[count.index]
filter {
  name = "tag:name"
  values = ["iac-sme-group-7-private-subnet-private-*"]
  }
  }
  
