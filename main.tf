module "vpc" {
  source               = "app.terraform.io/HashiCorp_TFC_Automation_Demo/vpc-network/aws"
  version              = "1.0.1"
  name                 = var.vpc_name
  env                  = var.env_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = split(", ", var.public_subnet_cidr)
  private_subnet_cidr  = split(", ", var.private_subnet_cidr)
  database_subnet_cidr = split(", ", var.database_subnet_cidr)
}
module "internet-gateway" {
  source   = "app.terraform.io/HashiCorp_TFC_Automation_Demo/module-internet-gateway/aws"
  version  = "1.0.3"
  vpc_id   = module.vpc.vpc_id
  name     = var.vpc_name
  env_name = var.env_name

  depends_on = [
    module.vpc.vpc_id
  ]

}
module "public-route" {
  source     = "app.terraform.io/HashiCorp_TFC_Automation_Demo/module-vpc-route-table/aws"
  version    = "1.0.10"
  route_name = ["public-route-table"]
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  route_info = local.public_route_info

  depends_on = [
    module.vpc.vpc_id
  ]
}


module "nat_gateway" {

  source   = "app.terraform.io/HashiCorp_TFC_Automation_Demo/module-nat-gateway/aws"
  version  = "1.0.8"
  name     = var.vpc_name
  env_name = var.env_name
  vpc_id   = module.vpc.vpc_id

  depends_on = [
    module.vpc.vpc_id
  ]
}
module "private-route" {

  source     = "app.terraform.io/HashiCorp_TFC_Automation_Demo/module-vpc-route-table/aws"
  version    = "1.0.10"
  route_name = ["private-route-table"]
  vpc_id     = module.vpc.vpc_id
  subnet_ids = flatten([module.vpc.private_subnet_ids, module.vpc.database_subnet_ids])
  route_info = local.private_route_info

  depends_on = [
    module.vpc.vpc_id
  ]
}