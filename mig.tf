resource "google_compute_region_instance_group_manager" "my_mig" {
  name                      = var.instance_group_mgr_name
  region                    = var.instance_group_mgr_zone
  distribution_policy_zones = [var.instance_group_dis_policy_1, var.instance_group_dis_policy_2]
  base_instance_name        = var.instance_group_base_ins_name
  version {
    instance_template = google_compute_region_instance_template.vm_template.id
  }
  auto_healing_policies {
    health_check      = google_compute_region_health_check.https-region-health-check.id
    initial_delay_sec = var.auto_healing_delay_sec
  }
  named_port {
    name = var.named_port_name
    port = var.named_port
  }
}

resource "google_compute_region_autoscaler" "my_autoscaler" {
  name   = var.auto_scaler_name
  target = google_compute_region_instance_group_manager.my_mig.id

  autoscaling_policy {
    max_replicas    = var.autoscaling_policy_max_replicas
    min_replicas    = var.autoscaling_policy_min_replicas
    cooldown_period = var.autoscaling_policy_cooldown

    cpu_utilization {
      target = var.auto_scaling_policy_cpu_utilization
    }
  }
}