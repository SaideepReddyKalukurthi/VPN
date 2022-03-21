data "google_compute_network" "my-network-1" {
  name = "cloud-vpc"
  project = var.project-name.cloud
}

data "google_compute_network" "my-network-2" {
  name = "onprem-vpc"
  project = var.project-name.on-prem
}

terraform {
  backend "gcs" {
    credentials = "key.json"
    bucket = "demo-demo-state"
    prefix = "deploy/vpn_ha/state"
  }
}