provider "google" {
  credentials = "${file("robust-form-362412-74d8b1e1b512.json")}"
  project     = "robust-form-362412"
  region      = "asia-south1"
  zone        = "asia-south1-c"
}
resource "google_compute_network" "vpc_network" {
name = "terraform-vpc"
auto_create_subnetworks = "false"
}
resource "google_compute_subnetwork" "public-subnetwork" {
name = "subnet1"
ip_cidr_range = "10.2.0.0/16"
region = "asia-south1"
network = google_compute_network.vpc_network.name
}
resource "google_compute_subnetwork" "private-subnetwork" {
name = "subnet2"
private_ip_google_access = "true"
ip_cidr_range = "10.3.0.0/16"
region = "asia-south1"
network = google_compute_network.vpc_network.name
}
