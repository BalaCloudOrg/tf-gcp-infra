# random string generation for cloud sql instance name
resource "random_string" "suffix" {
  length  = 3
  special = false
  numeric = false
  upper   = false
}

# CloudSQL Instance
resource "google_sql_database_instance" "instance" {
  name                = "webapp-db-instance-${random_string.suffix.result}"
  database_version    = "MYSQL_8_0"
  deletion_protection = false

  settings {
    tier              = "db-f1-micro"
    availability_type = "REGIONAL"
    disk_type         = "PD_SSD"
    disk_size         = 100
    backup_configuration {
      enabled            = true
      binary_log_enabled = true
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc_network.self_link

      #   dynamic "authorized_networks" {
      #     for_each = google_compute_instance.vm_instance
      #     iterator = vm_instance

      #     content {
      #       name  = vm_instance.value.name
      #       value = vm_instance.value.network_interface.0.access_config.0.nat_ip
      #     }
      #   }
    }
  }

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

# CloudSQL Database
resource "google_sql_database" "webapp_db" {
  name     = "webapp"
  instance = google_sql_database_instance.instance.name

  depends_on = [google_sql_database_instance.instance]
}

# CloudSQL Database User with Random Password
resource "random_password" "password" {
  length      = 8
  min_lower   = 1
  min_upper   = 1
  min_special = 1
  min_numeric = 1
}

resource "google_sql_user" "webapp_user" {
  name     = "user1"
  instance = google_sql_database_instance.instance.name
  password = random_password.password.result
}
