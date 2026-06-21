provider "google" {
  project = var.gcp_project_id
  region  = "us-west1"
}

# Provisioning high-performance, compute-optimized instances for the Nomad cluster.
resource "google_compute_instance" "nomad_x_server" {
  name         = "nomad-x-hft-node-1"
  machine_type = "c2-standard-4" # Compute-optimized for sub-millisecond execution
  zone         = "us-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 50
      type  = "pd-ssd"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = "root:${file("~/.ssh/nomad_x_ed25519.pub")}"
  }

  tags = ["nomad-cluster", "hft-infrastructure"]
}
