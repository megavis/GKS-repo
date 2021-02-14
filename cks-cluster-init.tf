variable "gcp_config" {
}

resource "google_compute_instance" "vm_instance" {
  name         = "master-node"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20201014"
      size = 50
    }
  }

  metadata_startup_script = "sudo bash -c 'bash <(curl -s https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_master.sh)'"

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
