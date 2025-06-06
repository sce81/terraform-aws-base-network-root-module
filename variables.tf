variable "vpc_version" {
  type        = string
  description = "Git Tag ID of the version of vpc module to import from the TFC registry"
  default     = "1.0.0"
}
variable "vpc_name" {
  type        = string
  description = "Descriptive name of VPC"
}
variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "AWS Region to deploy resources into"
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
variable "tgw_id" {
  type        = string
  description = "ID of Transit gateway (if one exists) to route traffic back to"
  default     = null
}
variable "network_cidr" {
  type        = string
  description = "Complete CIDR of internal network"
  default     = "10.0.0.0/8"
}
variable "public_route_info" {
  description = "Route Info for public route table"
  type = list(object({
    route_cidr     = optional(string)
    gateway_id     = optional(string)
    nat_gateway_id = optional(string)
  }))
  default = []
}

variable "private_route_info" {
  description = "Route Info for private route table"
  type = list(object({
    route_cidr     = optional(string)
    gateway_id     = optional(string)
    nat_gateway_id = optional(string)
  }))
  default = []
}

//variable "role_arn" {
//  default     = null
//  description = "AWS IAM Role to assume for this deployment# set as environment variable in workspace vars"
//}