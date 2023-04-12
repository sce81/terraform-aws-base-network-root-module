module "vpc" {
  source               = "app.terraform.io/HashiCorp_TFC_Automation_Demo/aws-vpc/module"
  version              = "1.0.0"
  name                 = var.vpc_name
  env                  = var.env_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = jsondecode([var.public_subnet_cidr])
  private_subnet_cidr  = jsondecode([var.private_subnet_cidr])
  database_subnet_cidr = jsondecode([var.database_subnet_cidr])
}
