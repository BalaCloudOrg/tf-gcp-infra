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
