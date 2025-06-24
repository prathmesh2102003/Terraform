variable "aws_region" {
  type    = string
  default = ""
}
variable "vpc_name" {
  type    = string
  default = ""
}
variable "cidr" {
  type    = string
  default = ""
}
variable "azs" {
  type    = list(string)
  default = [""]
}
variable "private_subnets" {
  type    = list(string)
  default = [""]
}
variable "public_subnets" {
  type    = list(string)
  default = [""]
}
variable "enable_nat_gateway" {
  type    = bool
  default = true
}
variable "single_nat_gateway" {
  type    = bool
  default = true
}
