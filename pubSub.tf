resource "google_pubsub_topic" "user_verification" {
  name = var.pubsub_topic_name
  message_storage_policy {
    allowed_persistence_regions = [var.pubsub_storage_region]
  }
  message_retention_duration = var.pubsub_retention_duration
}
