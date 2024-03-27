# VPC creation
resource "google_compute_network" "vpc_network" {
  name                            = var.vpc_name
  auto_create_subnetworks         = false
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = true
}

# Subnet creation - webapp
resource "google_compute_subnetwork" "subnet_webapp" {
  name          = var.webapp_subnet_name
  ip_cidr_range = var.webapp_subnet_cidr
  network       = google_compute_network.vpc_network.id
}

# Subnet creation - db
resource "google_compute_subnetwork" "subnet_db" {
  name          = var.db_subnet_name
  ip_cidr_range = var.db_subnet_cidr
  network       = google_compute_network.vpc_network.id
}

# Adding route
resource "google_compute_route" "route_for_vpc" {
  name             = var.vpc_route_name
  dest_range       = var.vpc_route_ip
  network          = google_compute_network.vpc_network.id
  next_hop_gateway = var.vpc_route_next_hop
}

resource "google_vpc_access_connector" "serverless_vpc_connector" {
  name          = var.serverless_vpc_conn_name
  region        = var.serverless_vpc_conn_region
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = var.serverless_vpc_conn_ip_cidr

  depends_on = [google_compute_network.vpc_network]
}