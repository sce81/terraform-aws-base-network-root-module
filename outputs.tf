output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}

output "nat_gw_ip" {
  value = module.nat_gateway.*.public_ip[*]
}
output "public_route" {
  value = module.public-route.route_table
}

output "private_route" {
  value = module.private-route.route_table
}