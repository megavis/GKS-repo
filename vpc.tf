
# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.gcp_config.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.gcp_config.project_id}-subnet"
  region        = var.gcp_config.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.0.0.0/24"

}

output "region" {
  value       = var.gcp_config.region
  description = "region"
}
