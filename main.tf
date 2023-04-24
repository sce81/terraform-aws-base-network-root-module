module "vpc" {
  source               = "app.terraform.io/HashiCorp_TFC_Automation_Demo/aws-vpc/module"
  version              = "1.0.0"
  name                 = var.vpc_name
  env                  = var.env_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = split(", ", var.public_subnet_cidr)
  private_subnet_cidr  = split(", ", var.private_subnet_cidr)
  database_subnet_cidr = split(", ", var.database_subnet_cidr)

}


module "internet-gateway" {
  source = "/Users/simon.elliott/Documents/Code/Terraform/modules/tfc/aws-tf-module-igw"
  //source               = "app.terraform.io/HashiCorp_TFC_Automation_Demo/module-internet-gateway/module"
  //version              = "1.0.0"
  vpc_id   = module.vpc.vpc_id
  name     = var.vpc_name
  env_name = var.env_name

}

module "public-route" {
  source     = "git@github.com:sce81/aws-tf-module-route-table.git"
  route_name = ["public-route-table"]
  vpc_id     = module.vpc.vpc_id
  name       = var.vpc_name
  env_name   = var.env_name
  subnet_ids = module.vpc.public_subnet_ids
  route_info = local.public_route_info
}

module "nat_gateway" {
  source            = "git@github.com:sce81/terraform-aws-module-nat-gateway"
  nat_gateway_count = 1
  name              = var.vpc_name
  env_name          = var.env_name
  vpc_id            = module.vpc.vpc_id
}