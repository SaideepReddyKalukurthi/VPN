provider "google" {
    project = "main-25-01"
    # credentials = "key.json"
}

data "google_compute_network" "my-network-1" {
  name = "cloud-vpc"
  project = var.project-name.cloud
}

data "google_compute_network" "my-network-2" {
  name = var.project-name.on-prem
}


module "subnets-1" {
    source = "../../modules/subnets"
    project_id   = var.project-name.cloud
    network_name = var.network-name.cloud

    subnets = [
        {
            subnet_name           = "cloud-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = var.regions-1["group-1"]
            subnet_private_access = true
        },
        {
            subnet_name           = "cloud-02"
            subnet_ip             = "10.10.50.0/24"
            subnet_region         = var.regions-1["group-2"]
            subnet_private_access = true
        },
    ]
    depends_on = [
      data.google_compute_network.my-network-1
    ]
}

module "subnets-2" {
    source = "../../modules/subnets"
    project_id   = var.project-name.on-prem
    network_name = var.network-name.on-prem
    subnets = [
        {
            subnet_name           = "on-prem-01"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = var.regions-2["group-1"]
            subnet_private_access = true
        },
        {
            subnet_name           = "on-prem-02"
            subnet_ip             = "10.10.60.0/24"
            subnet_region         = var.regions-2["group-2"]
            subnet_private_access = true
        },
    ]
    depends_on = [
      data.google_compute_network.my-network-2
    ]
}


