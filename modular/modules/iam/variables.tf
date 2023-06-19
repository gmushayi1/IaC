
variable "environment" {
  type    = string
  default = "development"
}

variable "task_role" {
  type        = string
  description = "ECS task IAM role"
  default     = ""
}


variable "execution_role" {
  type        = string
  description = "ECS task execution IAM role"
  default     = ""
}

