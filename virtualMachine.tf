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

  metadata = {
    startup-script = <<-EOT
    #!/bin/bash
    # Create a configuration file for the database
    cat <<EOF > /opt/config.env
    MYSQL_DATABASE="webapp"
    MYSQL_USER="user1"
    MYSQL_PASSWORD="${random_password.password.result}"
    MYSQL_HOST="${google_sql_database_instance.instance.ip_address[0].ip_address}"
    EOF
    EOT
  }

  tags       = [var.compute_instance_tag]
  depends_on = [google_compute_network.vpc_network, google_compute_subnetwork.subnet_webapp, google_sql_database_instance.instance]
}
