
variable "environment" {
  type    = string
  default = "development"
}

variable "zone_name" {
  type        = string
  description = "ECS task IAM role"
  default     = ""
}



