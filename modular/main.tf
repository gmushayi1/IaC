
# Creates VPC with 2 public and private subnets, NAT Gatteway and IGW
module "iac_sme_vpc" {
  source                      = "./modules/vpc"
  vpc-cidr                    = "10.0.0.0/16"
  enable_dns_support          = "true"
  vpc_name                    = "iac-sme-group-7-vpc-us-east-1"
  environment                 = "development"
  public_subnets_name_prefix  = "iac-sme-group-7-public-subnet"
  private_subnets_name_prefix = "iac-sme-group-7-private-subnet"
  public_rtb_prefix           = "iac-sme-group-7-public-rtb"
  private_rtb_prefix          = "iac-sme-group-7-private-rtb"
  igw_name_prefix             = "iac-sme-group-7-igw"
  eip_name_prefix             = "iac-sme-group-7-nat-eip"
  nat_name_prefix             = "iac-sme-group-7-nat-gateway"
}

# Creates ECR repositories
module "iac_sme_ecr" {
  source          = "./modules/ecr"
  ecr-repo        = ["micro01", "micro02", "iacfrontend"]
  ecr_name_prefix = "iac-sme-group-7-ecr"
  environment     = "development"
}

# Creates ECS clusters
module "iac_sme_ecs_cluster" {
  source             = "./modules/ecs-clusters"
  ecs_cluster_prefix = "iac-sme-group-7-cluster"
  environment        = "development"
}

# Creates ECS IAM roles
module "ecs_roles" {
  source         = "./modules/iam"
  task_role      = "task-role"
  execution_role = "execution_role"
  environment    = "development"
}

# Creates Route53 hosted zone
module "route_53" {
  source         = "./modules/route53"
  zone_name      = "iac-sme-group-7.com."
  environment    = "development"
}