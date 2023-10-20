locals {


  public_route_info  = var.enable_igw == false ? tolist(var.public_route_info) : concat(local.public_route_igw, local.ingress_route_info)
  private_route_info = var.enable_natgw == false ? var.private_route_info : local.private_route_natgw
  ingress_route_info = var.tgw_id == null ? [] : local.ingress_route_tgw

  public_route_igw = [
    {
      route_cidr = "0.0.0.0/0"
      gateway_id = var.enable_igw == false ? null : module.internet-gateway[0].igw
    }
  ]
  private_route_natgw = [
    {
      route_cidr     = "0.0.0.0/0"
      nat_gateway_id = var.enable_natgw == false ? null : element(module.nat_gateway[0].id, 0)
    }
  ]
  ingress_route_tgw = [
    {
      route_cidr         = var.network_cidr
      transit_gateway_id = var.tgw_id == null ? null : var.tgw_id
    }
  ]
}


data "aws_ec2_transit_gateway" "main" {
  id = var.tgw_id
}
