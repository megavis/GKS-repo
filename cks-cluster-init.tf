variable "gcp_config" {
}

locals {
  worker_nodes = toset([ "worker1" ])
#  worker_nodes = toset([ "worker1", "worker2" ])
}

resource "google_compute_instance" "vm_instance_master" {
  name         = "master-node"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20201014"
      size = 50
    }
  }

  metadata_startup_script = "sudo bash -c 'bash <(curl -s https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_master.sh) >> /var/log/setup-node.log 2>&1'"

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "vm_instance_worker" {
  for_each     = local.worker_nodes
  name         = "${each.value}-node"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20201014"
      size = 50
    }
  }

  metadata_startup_script = "sudo bash -c 'bash <(curl -s https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_worker.sh) >> /var/log/setup-node.log 2>&1'"

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

