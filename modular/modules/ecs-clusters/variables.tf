variable "environment" {
  type    = string
  default = "development"
}

variable "ecs_cluster_prefix" {
 type        = string
  description = "ECS cluster name prefix"
  default     = ""
}
