resource "google_compute_firewall" "allow_webapp_traffic" {
  name    = var.firewall_name_allow_webapp
  network = google_compute_network.vpc_network.name

  allow {
    protocol = var.tcp_protocol
    ports    = ["${var.application_port}"]
  }

  source_ranges = [var.firewall_source_range]
  target_tags   = [var.compute_instance_tag]

  depends_on = [google_compute_network.vpc_network]
}

resource "google_compute_firewall" "deny_ssh" {
  name    = var.firewall_name_deny_ssh
  network = google_compute_network.vpc_network.name

  deny {
    protocol = var.tcp_protocol
    ports    = ["${var.ssh_port}"]
  }

  source_ranges = [var.firewall_source_range]
  target_tags   = [var.compute_instance_tag]

  depends_on = [google_compute_network.vpc_network]
}
