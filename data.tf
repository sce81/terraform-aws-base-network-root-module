locals {
  public_route_info = [
    {
      route_cidr = "0.0.0.0/0"
      gateway_id = module.internet-gateway.igw
  }]
  private_route_info = [
    {
      route_cidr     = var.enable_natgw == true ? "0.0.0.0/0" : null
      nat_gateway_id = var.enable_natgw == true ? module.nat_gateway.id[0] : null
  }]


}