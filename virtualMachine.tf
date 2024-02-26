resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.custom_image_family
      type  = var.custom_image_type
      size  = var.custom_image_size
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet_webapp.id

    access_config {
        # automatically assign an ephipheral ip address - an external ip to access your VM
    }
  }

  tags       = [var.compute_instance_tag]
  depends_on = [google_compute_network.vpc_network, google_compute_subnetwork.subnet_webapp]
}
