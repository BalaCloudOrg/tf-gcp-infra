resource "google_compute_backend_service" "load_balancer_backend" {
  name                            = var.load_balancer_backend_name
  connection_draining_timeout_sec = var.lb_connection_draining
  health_checks                   = [google_compute_health_check.https-health-check.id]
  load_balancing_scheme           = var.lb_load_balancing_scheme
  port_name                       = var.lb_port_name
  protocol                        = var.lb_protocol
  session_affinity                = var.lb_session_affinity
  timeout_sec                     = var.lb_timeout_sec
  backend {
    group           = google_compute_region_instance_group_manager.my_mig.instance_group
    balancing_mode  = var.lb_be_balancing_mode
    capacity_scaler = var.lb_be_capacity_scaler
    max_utilization = var.lb_be_max_utilization
  }
  log_config {
    enable = var.lb_log_enabled
  }
}

resource "google_compute_url_map" "web_app_https" {
  name            = var.gc_url_map_name
  default_service = google_compute_backend_service.load_balancer_backend.id
}

resource "google_compute_target_https_proxy" "https_lb_proxy" {
  name             = var.target_https_proxy_name
  url_map          = google_compute_url_map.web_app_https.id
  ssl_certificates = [google_compute_managed_ssl_certificate.google_managed_ssl.id]
  depends_on       = [google_compute_managed_ssl_certificate.google_managed_ssl]
}

resource "google_compute_global_forwarding_rule" "https_fw_rule" {
  name                  = var.global_fw_rule_name
  ip_protocol           = var.global_fw_rule_ip_protocol
  load_balancing_scheme = var.global_fw_rule_lb_scheme
  port_range            = var.global_fw_rule_port_range
  target                = google_compute_target_https_proxy.https_lb_proxy.id
}