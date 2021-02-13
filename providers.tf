provider "google" {
  version = "3.48.0"
  project = var.gcp_config.project
  region  = var.gcp_config.region
  zone    = var.gcp_config.zone
}
