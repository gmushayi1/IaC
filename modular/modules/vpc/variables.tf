variable "vpc-cidr" {
  type        = string
  description = "VPC network range"
  default     = ""
}

variable "environment" {
  description = "stage ie development, production, QA etc"
  type        = string
  default     = "development"
}


variable "enable_dns_support" {
  type        = string
  description = "VPC network range"
  default     = ""
}

variable "vpc_name" {
  type        = string
  description = "VPC name tag"
  default     = ""
}

variable "public_subnets_name_prefix" {
  type        = string
  description = "name prefix for public subnets"
  default     = ""
}

variable "private_subnets_name_prefix" {
  type        = string
  description = "name prefix for private subnets"
  default     = ""
}

variable "public_rtb_prefix" {
  type        = string
  description = "name prefix for public route tables"
  default     = ""
}

variable "private_rtb_prefix" {
  type        = string
  description = "name prefix for private route tables"
  default     = ""
}

variable "igw_name_prefix" {
  type        = string
  description = "name prefix for Internet Gateway"
  default     = ""
}

variable "eip_name_prefix" {
  type        = string
  description = "name prefix for Elastic IP"
  default     = ""
}

variable "nat_name_prefix" {
  type        = string
  description = "name prefix for NAT Gateway"
  default     = ""
}


variable "public-subnets" {
  default = {
    "public-subnet-1" = 1
    "public-subnet-2" = 2
    #"public-subnet-3" = 3
  }
}

variable "private-subnets" {
  default = {
    "private-subnet-1" = 1
    "private-subnet-2" = 2
    #"private-subnet-3" = 3
  }
}

variable "cidr" {
  type    = string
  default = "0.0.0.0/0"
}
