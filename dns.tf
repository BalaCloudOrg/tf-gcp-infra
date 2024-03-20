data "google_dns_managed_zone" "existing_zone" {
  name = var.custom_dns_zone_name
}

resource "google_dns_record_set" "custom_dns_record" {
  name         = var.custom_domain_name
  type         = var.dns_record_type_A
  managed_zone = data.google_dns_managed_zone.existing_zone.name
  ttl          = var.dns_record_ttl
  rrdatas      = [google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip]
}