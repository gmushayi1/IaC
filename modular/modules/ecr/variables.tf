
variable "ecr-repo" {
  description = "Create ecr repositories with these names"
  type        = list(string)
  default     = [""]
}

variable "ecr_name_prefix" {
  type        = string
  description = "ECR repo name prefix"
  default     = ""

}

variable "environment" {
  description = "stage ie development, production, QA etc"
  type        = string
  default     = ""
}
