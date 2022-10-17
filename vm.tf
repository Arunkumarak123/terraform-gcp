provider "google" {
  credentials = "${file("robust-form-362412-74d8b1e1b512.json")}"
  project     = "robust-form-362412"
  region      = "asia-south1"
  zone        = "asia-south1-c"
}

resource "google_compute_instance" "default" {
  allow_stopping_for_update = "true"
  name         = "arun"
  machine_type = "e2-small"
  zone         = "asia-south1-c"

  boot_disk {
    initialize_params {
      image = "centos-7-v20220920"
      size  = 50
      type  = "pd-ssd"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}
output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
