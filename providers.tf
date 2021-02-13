provider "google" {
#  version = "3.56.0"
#  project_id = var.gcp_config.project_id
  project = var.gcp_config.project_id
  region  = var.gcp_config.region
  zone    = var.gcp_config.zone
}
