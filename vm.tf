
resource "google_compute_instance" "default" {
  allow_stopping_for_update = "true"
  name         = "dev-jenkins"
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
    network = "dev-vpc"
    subnetwork = "dev-public-subnet-1"


    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}
output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
