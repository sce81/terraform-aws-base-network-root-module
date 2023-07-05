output "vpc_id" {
  value = module.vpc.vpc_id
}

output "nat_gw_ip" {
  value = module.nat_gateway.*.public_ip[*]
}
