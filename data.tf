locals {
  public_route_info = [
    {
      route_cidr = "0.0.0.0/0"
      gateway_id = module.internet-gateway.igw
  }]
  private_route_info = [
    {
      route_cidr     = "0.0.0.0/0"
      nat_gateway_id = module.nat_gateway.id[0]
  }]
}