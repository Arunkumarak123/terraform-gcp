provider "google" {
  credentials = "${file("robust-form-362412-74d8b1e1b512.json")}"
  project     = "robust-form-362412"
  region      = "asia-south1"
  zone        = "asia-south1-c"
}
resource "google_compute_network" "vpc_network" {
name = "dev-vpc"
auto_create_subnetworks = "false"
}
resource "google_compute_subnetwork" "public-subnetwork" {
name = "dev-public-subnet-1"
ip_cidr_range = "10.2.0.0/16"
region = "asia-south1"
network = google_compute_network.vpc_network.name
secondary_ip_range {
    range_name    = "sec-range-1"
    ip_cidr_range = "10.0.26.0/24"
  }
secondary_ip_range {
    range_name    = "sec-range-2"
    ip_cidr_range = "10.0.28.0/24"
  }


}
resource "google_compute_subnetwork" "private-subnetwork-1" {
name = "dev-private-subnet1"
private_ip_google_access = "true"
ip_cidr_range = "10.3.0.0/16"
region = "asia-south1"
network = google_compute_network.vpc_network.name
secondary_ip_range {
    range_name    = "sec-range-3"
    ip_cidr_range = "10.0.22.0/24"
  }
}
resource "google_compute_subnetwork" "private-subnetwork-2" {
name = "dev-private-subnet2"
private_ip_google_access = "true"
ip_cidr_range = "10.4.0.0/16"
region = "asia-south1"
network = google_compute_network.vpc_network.name
secondary_ip_range {
    range_name    = "sec-range-4"
    ip_cidr_range = "10.0.23.0/24"
  }
}
