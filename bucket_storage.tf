
resource "google_storage_bucket" "serverless_cloud_fn" {
  name                        = "${var.serverless_cloud_fn_name}${random_string.suffix.result}"
  location                    = var.bucket_location

  encryption {
    default_kms_key_name = google_kms_crypto_key.bucket_storage_key.id
  }

  depends_on = [ google_kms_crypto_key_iam_binding.crypto_key_bucket ]
}

resource "google_storage_bucket_object" "zip_file" {
  name    = var.bucket_object_name
  bucket  = google_storage_bucket.serverless_cloud_fn.name
  source  = var.bucket_object_source
  depends_on = [ google_storage_bucket.serverless_cloud_fn ]
}