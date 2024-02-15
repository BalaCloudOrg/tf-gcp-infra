provider "google" {
  project = "webapp-infra"
  region = "us-east1"
}

# VPC creation
resource "google_compute_network" "vpc_network" {
    name = "my-vpc"
    auto_create_subnetworks = false
    routing_mode = "REGIONAL"
    delete_default_routes_on_create = true
}

# Subnet creation 1
resource "google_compute_subnetwork" "subnet_1" {
    name = "webapp"
    ip_cidr_range = "10.0.0.0/24"
    network = google_compute_network.vpc_network.id
}

# Subnet creation 2
resource "google_compute_subnetwork" "subnet_2" {
    name = "db"
    ip_cidr_range = "10.0.1.0/24"
    network = google_compute_network.vpc_network.id
}

# Adding route
resource "google_compute_route" "route_for_webapp_subnet" {
    name = "webapp-subnet-route"
    dest_range = "0.0.0.0/0"
    network = google_compute_network.vpc_network.id
    next_hop_gateway = "default-internet-gateway"
}