variable "vpc-cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public-subnets" {
  default = {
    "public-subnet-1" = 1
    "public-subnet-2" = 2
    "public-subnet-3" = 3
  }
}

variable "private-subnets" {
  default = {
    "private-subnet-1" = 1
    "private-subnet-2" = 2
    "private-subnet-3" = 3
  }
}

variable "cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "environment" {
  type    = string
  default = "development"
}

variable "ecr-repo" {
  description = "Create ecr repositories with these names"
  type        = list(string)
  default     = ["micro01", "micro02", "iacfrontend"]
}