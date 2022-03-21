output "network-name-1" {
    value = module.vpc-1.network_name  
}

output "network-link-1" {
    value = module.vpc-1.network_self_link
}

output "network-id-1" {
    value = module.vpc-1.network_id
}

output "network-name-2" {
    value = module.vpc-2.network_name  
}

output "network-link-2" {
    value = module.vpc-2.network_self_link
}

output "network-id-2" {
    value = module.vpc-2.network_id
}
