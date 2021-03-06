#
# MAINTAINER Vitaliy Natarov "vitaliy.natarov@yahoo.com"
#
terraform {
  required_version = "~> 0.13"
}

provider "google" {
  credentials = file("/Users/captain/.config/gcloud/creds/terraform_creds.json")
  project     = "terraform-2018"
  region      = "us-east1"
}

module "compute_address" {
  source = "../../modules/compute_address"
  name   = "TEST"

  enable_compute_address        = true
  enable_compute_global_address = true
}
