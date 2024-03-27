data "google_storage_bucket" "existing_bucket" {
  name = var.data_existing_bucket_name
}

data "google_storage_bucket_object" "existing_object" {
  name   = var.data_existing_object
  bucket = data.google_storage_bucket.existing_bucket.name
}

resource "google_cloudfunctions2_function" "user_verification_function" {
  name        = var.gcloud_fn_name
  description = var.gcloud_fn_desc
  location    = var.gcloud_fn_location

  build_config {
    entry_point = var.gcloud_fn_entry_pt
    runtime     = var.gcloud_fn_runtime

    source {
      storage_source {
        bucket = data.google_storage_bucket.existing_bucket.name
        object = data.google_storage_bucket_object.existing_object.name
      }
    }
  }

  service_config {
    available_memory      = var.gcloud_fn_serv_config_mem
    timeout_seconds       = var.gcloud_fn_serv_config_timeout
    service_account_email = google_service_account.serverless_service_account.email

    ingress_settings              = var.gcloud_fn_serv_config_ingress
    vpc_connector                 = google_vpc_access_connector.serverless_vpc_connector.id
    vpc_connector_egress_settings = var.gcloud_fn_serv_config_egress

    environment_variables = {
      SQLHOST  = google_sql_database_instance.instance.ip_address[0].ip_address
      DBNAME   = google_sql_database.webapp_db.name
      USERNAME = google_sql_user.webapp_user.name
      PASSWORD = random_password.password.result
    }
  }

  event_trigger {
    event_type            = var.gcloud_fn_event_trigger_type
    pubsub_topic          = google_pubsub_topic.user_verification.id
    service_account_email = google_service_account.serverless_service_account.email
    retry_policy          = var.gcloud_fn_event_trigger_retry
  }

  depends_on = [google_sql_database_instance.instance]
}