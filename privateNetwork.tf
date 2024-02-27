# Enable Service Networking API
# resource "google_project_service" "service_networking" {
#   service = "servicenetworking.googleapis.com"
#   project = var.project_id
# }

# Setup Private Services Access for Cloud SQL
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc_network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_services_range.name]

  depends_on = [google_compute_global_address.private_services_range]
}

resource "google_compute_global_address" "private_services_range" {
  name          = var.ip_address_range_private_network_access
  purpose       = var.purpose_vpc_peering
  address_type  = var.address_type_VPC_peering
  prefix_length = 16
  network       = google_compute_network.vpc_network.self_link
}