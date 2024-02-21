resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.custom_image_self_link
      type  = "pd-balanced"
      size  = 100
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet_webapp.id

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  tags = ["web-app"]
  depends_on = [ google_compute_address.static, google_compute_network.vpc_network, google_compute_subnetwork.subnet_webapp ]
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
}