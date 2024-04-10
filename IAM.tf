resource "google_project_iam_binding" "logging_admin" {
  project = var.project_id
  role    = var.iam_binding_logging_admin_role

  members = [
    "${var.var_service_account}${google_service_account.vm_service_account.email}",
  ]
}

resource "google_project_iam_binding" "monitoring_metric_writer" {
  project = var.project_id
  role    = var.iam_binding_monitoring_writer_role

  members = [
    "${var.var_service_account}${google_service_account.vm_service_account.email}",
  ]
}

resource "google_project_iam_binding" "pubsub_publisher" {
  project = var.project_id
  role    = var.iam_binding_pubsub_publisher

  members = [
    "${var.var_service_account}${google_service_account.vm_service_account.email}",
  ]
}

resource "google_project_iam_binding" "service_account_token_creator" {
  project = var.project_id
  role    = var.iam_binding_ser_acc_token_creator

  members = [
    "${var.var_service_account}${google_service_account.serverless_service_account.email}",
  ]
}

resource "google_project_iam_binding" "cloud_sql_client" {
  project = var.project_id
  role    = var.iam_binding_cloud_sql_client

  members = [
    "${var.var_service_account}${google_service_account.serverless_service_account.email}",
  ]
}

resource "google_project_iam_binding" "cloud_run_invoker" {
  project = var.project_id
  role    = var.iam_binding_cloud_run_invoker

  members = [
    "${var.var_service_account}${google_service_account.serverless_service_account.email}",
  ]
}

data "google_project" "current" {}

resource "google_kms_crypto_key_iam_binding" "crypto_key_sql" {
  crypto_key_id = google_kms_crypto_key.cloud_sql_key.id
  role          = var.iam_binding_key_encrypt_decrypt

  members = [
    "${var.key_service_acc_prefix}${data.google_project.current.number}${var.sql_sa_key_suffix}",
  ]
}


resource "google_kms_crypto_key_iam_binding" "crypto_key_vm" {
  crypto_key_id = google_kms_crypto_key.compute_instance_key.id
  role          = var.iam_binding_key_encrypt_decrypt

  members = [
    "${var.key_service_acc_prefix}${data.google_project.current.number}${var.compute_sa_key_suffix}",
  ]
}

resource "google_kms_crypto_key_iam_binding" "crypto_key_bucket" {
  crypto_key_id = google_kms_crypto_key.bucket_storage_key.id
  role          = var.iam_binding_key_encrypt_decrypt

  members = [
    "${var.key_service_acc_prefix}${data.google_project.current.number}${var.storage_sa_key_suffix}",
  ]
}