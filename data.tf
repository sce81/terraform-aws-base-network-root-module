locals {


  public_route_info  = var.enable_igw == false ? var.public_route_info : local.public_route_igw
  private_route_info = var.enable_natgw == false ? var.private_route_info : local.private_route_natgw

  public_route_igw = [
    {
      route_cidr = "0.0.0.0/0"
      gateway_id = var.enable_igw == false ? null : module.internet-gateway[0].igw
    }
  ]
  private_route_natgw = [
    {
      route_cidr     = "0.0.0.0/0"
      nat_gateway_id = var.enable_natgw == false ? null : module.nat_gateway[0].id
    }
  ]
}