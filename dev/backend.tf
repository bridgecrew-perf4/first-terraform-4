provider "google" {
  project = "terra-dev"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-c"
}

resource "google_compute_instance" "vm_instance" {
  name                      = "terraform-instance"
  machine_type              = "f1-micro"
  allow_stopping_for_update = "true"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_instance" "another_vm_instance" {
  name                      = "manual-instance"
  machine_type              = "g1-small"
  allow_stopping_for_update = "true"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
