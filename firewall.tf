resource "google_compute_firewall" "rules" {
  name        = "my-firewall-rule"
  network     = "terraform-vpc"
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = ["80", "8080", "1000-2000","22"]
  }
  source_tags = ["dev-public-subnet1"]
  target_tags = ["dev-private-subnet-1"]

}
