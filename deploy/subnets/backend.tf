terraform {
  backend "gcs" {
    credentials = "key.json"
    bucket = "demo-demo-state"
    prefix = "deploy/subnets/state"
  }
}