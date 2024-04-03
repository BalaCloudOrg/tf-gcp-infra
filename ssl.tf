resource "google_compute_managed_ssl_certificate" "google_managed_ssl" {
  name = var.ssl_certificate_name

  managed {
    domains = [var.custom_domain_name]
  }
}