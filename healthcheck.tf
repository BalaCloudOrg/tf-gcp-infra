resource "google_compute_region_health_check" "https-region-health-check" {
  name   = var.region_health_check_name
  region = var.https_region_health_check_zone

  http_health_check {
    request_path = var.health_check_endpoint
    port         = var.health_check_port
  }
}

resource "google_compute_health_check" "https-health-check" {
  name = var.health_check_name

  http_health_check {
    request_path = var.health_check_endpoint
    port         = var.health_check_port
  }
}