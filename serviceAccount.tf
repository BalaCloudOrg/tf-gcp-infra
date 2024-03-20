resource "google_service_account" "vm_service_account" {
  account_id   = var.vm_service_account
  display_name = var.vm_service_acc_display_name
}
