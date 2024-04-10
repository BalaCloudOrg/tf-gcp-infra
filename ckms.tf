resource "google_kms_key_ring" "my_key_ring" {
  name     = "${var.key_ring_name}${random_string.suffix.result}"
  location = var.key_ring_location
}

resource "google_kms_crypto_key" "compute_instance_key" {
  name            = "${var.compute_instance_key_name}${random_string.suffix.result}"
  key_ring        = google_kms_key_ring.my_key_ring.id
  purpose         = var.key_purpose
  rotation_period = var.key_rotation_period #30 days in seconds
}

resource "google_kms_crypto_key" "cloud_sql_key" {
  name            = "${var.cloud_sql_key_name}${random_string.suffix.result}"
  key_ring        = google_kms_key_ring.my_key_ring.id
  purpose         = var.key_purpose
  rotation_period = var.key_rotation_period #30 days in seconds
}

resource "google_kms_crypto_key_version" "cloud_sql_key_version" {
  crypto_key = google_kms_crypto_key.cloud_sql_key.id
}

resource "google_kms_crypto_key" "bucket_storage_key" {
  name            = "${var.bucket_storage_key}${random_string.suffix.result}"
  key_ring        = google_kms_key_ring.my_key_ring.id
  purpose         = var.key_purpose
  rotation_period = var.key_rotation_period #30 days in seconds
}