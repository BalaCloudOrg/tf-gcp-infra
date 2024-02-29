# random string generation for cloud sql instance name
resource "random_string" "suffix" {
  length  = var.random_string_len
  special = false
  numeric = false
  upper   = false
}

# CloudSQL Instance
resource "google_sql_database_instance" "instance" {
  name                = "${var.google_sql_instance_name}${random_string.suffix.result}"
  database_version    = var.google_sql_instance_db_version
  deletion_protection = var.google_sql_database_instance_del

  settings {
    tier              = var.google_sql_instance_tier
    availability_type = var.google_sql_instance_avl_type
    disk_type         = var.google_sql_instance_disk_type
    disk_size         = var.google_sql_instance_disk_size
    backup_configuration {
      enabled            = var.google_sql_database_instance_backup_enabled
      binary_log_enabled = var.google_sql_database_instance_backup_binlog
    }

    ip_configuration {
      ipv4_enabled    = var.google_sql_database_instance_ipv4_enabled
      private_network = google_compute_network.vpc_network.self_link
    }
  }

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

# CloudSQL Database
resource "google_sql_database" "webapp_db" {
  name     = var.google_sql_database_name
  instance = google_sql_database_instance.instance.name

  depends_on = [google_sql_database_instance.instance]
}

# CloudSQL Database User with Random Password
resource "random_password" "password" {
  length      = var.random_password_length
  min_lower   = 1
  min_upper   = 1
  min_special = 1
  min_numeric = 1
}

resource "google_sql_user" "webapp_user" {
  name     = var.google_sql_database_user
  instance = google_sql_database_instance.instance.name
  password = random_password.password.result
}
