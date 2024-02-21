resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.custom_image_self_link
      type  = var.custom_image_type
      size  = var.custom_image_size
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet_webapp.id

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  tags       = [var.compute_instance_tag]
  depends_on = [google_compute_address.static, google_compute_network.vpc_network, google_compute_subnetwork.subnet_webapp]
}

resource "google_compute_address" "static" {
  name = var.external_ip_add_range
}