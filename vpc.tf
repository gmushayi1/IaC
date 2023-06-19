#Create the VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(
    { Name = "iac-sme-group-7-vpc-us-east-1" },
    local.required_tags
  )
}

#Create 3 public subnets
resource "aws_subnet" "public-subnets-tf" {
  for_each                = var.public-subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.vpc-cidr, 8, each.value + 100)
  availability_zone       = tolist(data.aws_availability_zones.available-azs.names)[each.value - 1]
  map_public_ip_on_launch = true
  tags = merge(
    { Name = "iac-sme-group-7-public-subnet-${each.key}" },
    local.required_tags
  )
}


#Create 3 private subnetts
resource "aws_subnet" "private-subnets-tf" {
  for_each                = var.private-subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.vpc-cidr, 8, each.value)
  availability_zone       = tolist(data.aws_availability_zones.available-azs.names)[each.value - 1]
  map_public_ip_on_launch = false
  tags = merge(
    { Name = "iac-sme-group-7-private-subnet-${each.key}" },
    local.required_tags
  )
}

#Create route table for public subnets
resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = merge(
    { Name = "iac-sme-group-7-public-rtb" },
    local.required_tags
  )
}


#Create route table for private subnets 
resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }
  tags = merge(
    { Name = "iac-sme-group-7-private-rtb" },
    local.required_tags
  )
}

# public route table association
resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.public-subnets-tf]
  route_table_id = aws_route_table.public-rtb.id
  for_each       = aws_subnet.public-subnets-tf
  subnet_id      = each.value.id
}

# private route table association
resource "aws_route_table_association" "private" {
  depends_on     = [aws_subnet.private-subnets-tf]
  route_table_id = aws_route_table.private-rtb.id
  for_each       = aws_subnet.private-subnets-tf
  subnet_id      = each.value.id
}

# Internet gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    { Name = "iac-sme-group-7-igw" },
    local.required_tags
  )
}


# Create EIP for NAT Gateway
resource "aws_eip" "nat-gateway-eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet-gateway]
  tags = merge(
    { Name = "iac-sme-group-7-nat-eip" },
    local.required_tags
  )
}

#Create NAT Gateway
resource "aws_nat_gateway" "nat-gateway" {
  depends_on    = [aws_subnet.public-subnets-tf]
  allocation_id = aws_eip.nat-gateway-eip.id
  subnet_id     = aws_subnet.public-subnets-tf["public-subnet-1"].id
  tags = merge(
    { Name = "iac-sme-group-7-nat-gateway" },
    local.required_tags
  )
}

# Save VPC Id in Parameter store
resource "aws_ssm_parameter" "vpcId" {
  name  = "/${local.team}/${var.environment}/deployments/lookup/vpcId"
  type  = "String"
  value = aws_vpc.vpc.id
  tags = merge(
    local.required_tags,
  )
}
