resource "google_compute_firewall" "allow_webapp_traffic" {
  name    = var.firewall_name_allow_webapp
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["${var.application_port}"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-app"]

  depends_on = [ google_compute_network.vpc_network ]
}

resource "google_compute_firewall" "deny_ssh" {
  name    = var.firewall_name_deny_ssh
  network = google_compute_network.vpc_network.name

  deny {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["web-app"]

  depends_on = [ google_compute_network.vpc_network ]
}
