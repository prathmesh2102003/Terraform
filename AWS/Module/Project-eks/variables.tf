variable "aws_region" {
  type    = string
  default = ""
}
variable "cluster_name" {
  type    = string
  default = ""
}
variable "cluster_version" {
  type    = number
  default = 1.31
}
variable "subnet_ids" {
  type    = list(string)
  default = [""]
}
variable "vpc_id" {
  type    = string
  default = ""
}
variable "enable_irsa" {
  type    = bool
  default = true
}
variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}
variable "enable_cluster_creator_admin_permissions" {
  type    = bool
  default = true
}
variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}
