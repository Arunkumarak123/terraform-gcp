resource "google_compute_router_nat" "terraform-vpc" {
  name                               = "dev-nat"
  router                             = "dev-router"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name = "dev-public-subnet1"
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
  }
}
