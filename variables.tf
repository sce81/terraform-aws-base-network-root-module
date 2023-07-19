variable "vpc_version" {
  type        = string
  description = "Git Tag ID of the version of vpc module to import from the TFC registry"
  default     = "1.0.0"
}
variable "vpc_name" {
  type        = string
  description = "Descriptive name of VPC"
}
variable "env_name" {
  type        = string
  description = "Descriptive name of Environment"
}
variable "project_name" {
  type        = string
  default     = null
  description = "Descriptive name of Project"
}
variable "vpc_cidr" {
  type        = string
  description = "CIDR to assign to VPC Network"
}
variable "public_subnet_cidr" {
  type        = string
  default     = null
  description = "(Optional) CIDR values to be assigned to Public defined VPC Subnets"
}
variable "private_subnet_cidr" {
  type        = string
  default     = null
  description = "(Optional) CIDR values to be assigned to Private defined VPC Subnets"
}
variable "database_subnet_cidr" {
  type        = string
  default     = null
  description = "(Optional) CIDR values to be assigned to Database defined VPC Subnets"
}

variable "cross_account_role" {
  type        = string
  description = "REQUIRED: IAM Role ARN for terraform worker to assume in order to execute actions in this account"
  default     = null
}

variable "enable_igw" {
  type        = bool
  description = "Boolean: Deploy Internet GW to this VPC"
  default     = false
}
variable "enable_natgw" {
  type        = bool
  description = "Boolean: Deploy NAT GW to this VPC"
  default     = false
}
variable "public_route_info" {
  description = "Route Info for public route table"
  type = list(object({
    route_cidr     = optional(string)
    gateway_id     = optional(string)
    nat_gateway_id = optional(string)
  }))
  default = [{}]
}

variable "private_route_info" {
  description = "Route Info for public route table"
  type = list(object({
    route_cidr     = optional(string)
    gateway_id     = optional(string)
    nat_gateway_id = optional(string)
  }))
  default = [{}]
}