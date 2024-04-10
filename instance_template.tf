resource "google_compute_region_instance_template" "vm_template" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  region       = var.instance_template_region

  disk {
    boot         = var.instance_template_boot_disk
    source_image = var.custom_image_family_name
    disk_type    = var.custom_image_type
    disk_size_gb = var.custom_image_size
    disk_encryption_key {
      kms_key_self_link = google_kms_crypto_key.compute_instance_key.id
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
    if [ ! -f /opt/config.env ]; then
      cat <<EOF > /opt/config.env
      MYSQL_DATABASE="webapp"
      MYSQL_USER="user1"
      MYSQL_PASSWORD="${random_password.password.result}"
      MYSQL_HOST="${google_sql_database_instance.instance.ip_address[0].ip_address}"
EOF
    else
      echo "file already exists"
    fi
    EOT
  }

  service_account {
    email  = google_service_account.vm_service_account.email
    scopes = [var.ser_acc_logging_write_scope, var.ser_acc_monitoring_write_scope, var.ser_acc_pubsub_scope, var.ser_acc_cloud_platform_scope]
  }

  tags       = [var.compute_instance_tag]
  depends_on = [google_compute_network.vpc_network, google_compute_subnetwork.subnet_webapp, google_sql_database_instance.instance, google_service_account.vm_service_account]
}
