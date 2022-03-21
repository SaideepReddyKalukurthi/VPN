

provider "google" {
    project = "main-25-01"      
}

module "vpc-1" {
    source = "../../modules/vpc"
   # version = "~> 2.0.0"

    project_id   = var.project-name.cloud
    network_name = var.network-name.cloud

    shared_vpc_host = false
}

module "vpc-2" {
    source = "../../modules/vpc"
   # version = "~> 2.0.0"

    project_id   = var.project-name.on-prem
    network_name = var.network-name.on-prem

    shared_vpc_host = false
}


