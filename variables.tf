variable "project_id" {
  description = "The name of the project in which resources will be provisioned"
  type        = string
}

variable "region" {
  description = "The region where resources will be provisioned"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "webapp_subnet_name" {
  description = "The name of the webapp subnet"
  type        = string
}

variable "db_subnet_name" {
  description = "The name of the db subnet"
  type        = string
}

variable "webapp_subnet_cidr" {
  description = "IP with CIDR range for webapp subnet"
  type        = string
}

variable "db_subnet_cidr" {
  description = "IP with CIDR range for db subnet"
  type        = string
}

variable "vpc_route_name" {
  description = "The name of the route for VPC"
  type        = string
}

variable "vpc_route_ip" {
  description = "The IP address of the VPC route"
  type        = string
}

variable "routing_mode" {
  description = "The routing mode of the VPC network"
  type        = string
}

variable "vpc_route_next_hop" {
  type    = string
  default = "default-internet-gateway"
}

variable "application_port" {
  description = "The port that the application listens to."
  type        = number
  default     = 3000
}

variable "custom_image_family" {
  description = "The self-link of the custom image for the Compute Engine instance."
  type        = string
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "instance_zone" {
  description = "The zone where the Compute Engine instance will be created."
  type        = string
  default     = "us-east1-b"
}

variable "instance_machine_type" {
  description = "The machine type of the Compute Engine instance."
  type        = string
  default     = "e2-medium"
}

variable "firewall_name_allow_webapp" {
  description = "The name of the webapp firewall which allows incoming traffic"
  type        = string
}

variable "firewall_name_deny_ssh" {
  description = "The name of the webapp firewall which denies ssh traffic"
  type        = string
}

variable "custom_image_type" {
  description = "The type of the custom image"
  type        = string
  default     = "pd-balanced"
}

variable "custom_image_size" {
  description = "The size of the custom image"
  type        = number
  default     = 20
}

variable "firewall_source_range" {
  type    = string
  default = "0.0.0.0/0"
}

variable "compute_instance_tag" {
  type    = string
  default = "web-app"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "tcp_protocol" {
  type    = string
  default = "tcp"
}

variable "ip_address_range_private_network_access" {
  description = "Private IP address range for private network access"
  type        = string
  default     = "private-ip-range-for-private-network-access"
}

variable "purpose_vpc_peering" {
  type    = string
  default = "VPC_PEERING"
}

variable "address_type_VPC_peering" {
  type    = string
  default = "INTERNAL"
}

variable "service_networking_service_name" {
  type    = string
  default = "servicenetworking.googleapis.com"
}

variable "google_compute_global_add_prefix_len" {
  type    = number
  default = 16
}

variable "random_string_len" {
  type    = number
  default = 3
}

variable "google_sql_instance_name" {
  type    = string
  default = "webapp-db-instance-"
}

variable "google_sql_instance_db_version" {
  type    = string
  default = "MYSQL_8_0"
}

variable "google_sql_instance_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "google_sql_instance_avl_type" {
  type    = string
  default = "REGIONAL"
}

variable "google_sql_instance_disk_type" {
  type    = string
  default = "PD_SSD"
}

variable "google_sql_instance_disk_size" {
  type    = number
  default = 100
}

variable "google_sql_database_instance_del" {
  type    = bool
  default = false
}

variable "google_sql_database_instance_ipv4_enabled" {
  type    = bool
  default = false
}

variable "google_sql_database_instance_backup_enabled" {
  type    = bool
  default = true
}

variable "google_sql_database_instance_backup_binlog" {
  type    = bool
  default = true
}

variable "google_sql_database_name" {
  type    = string
  default = "webapp"
}

variable "random_password_length" {
  type    = number
  default = 8
}

variable "google_sql_database_user" {
  type    = string
  default = "user1"
}

variable "vm_service_account" {
  type    = string
  default = "vm-service-account"
}

variable "vm_service_acc_display_name" {
  type    = string
  default = "VM Service Account - logging"
}

variable "custom_dns_zone_name" {
  type    = string
  default = "my-dns-zone"
}

variable "custom_domain_name" {
  type    = string
  default = "cloudnativewebapp.me."
}

variable "dns_record_type_A" {
  type    = string
  default = "A"
}

variable "dns_record_ttl" {
  type    = number
  default = 300
}

variable "iam_binding_logging_admin_role" {
  type    = string
  default = "roles/logging.admin"
}

variable "iam_binding_monitoring_writer_role" {
  type    = string
  default = "roles/monitoring.metricWriter"
}

variable "var_service_account" {
  type    = string
  default = "serviceAccount:"
}

variable "ser_acc_logging_write_scope" {
  type    = string
  default = "logging-write"
}

variable "ser_acc_monitoring_write_scope" {
  type    = string
  default = "monitoring-write"
}

variable "com_eng_allow_stop_for_update" {
  type    = bool
  default = true
}

variable "iam_binding_pubsub_publisher" {
  type    = string
  default = "roles/pubsub.publisher"
}

variable "iam_binding_ser_acc_token_creator" {
  type    = string
  default = "roles/iam.serviceAccountTokenCreator"
}

variable "iam_binding_cloud_sql_client" {
  type    = string
  default = "roles/cloudsql.client"
}

variable "iam_binding_cloud_run_invoker" {
  type    = string
  default = "roles/run.invoker"
}

variable "pubsub_topic_name" {
  type    = string
  default = "verify_email"
}

variable "pubsub_storage_region" {
  type    = string
  default = "us-east1"
}

variable "pubsub_retention_duration" {
  type    = string
  default = "604800s"
}

variable "data_existing_bucket_name" {
  type    = string
  default = "serverless-cloud-fn"
}

variable "data_existing_object" {
  type    = string
  default = "function-source.zip"
}

variable "gcloud_fn_name" {
  type    = string
  default = "verify-email-function"
}

variable "gcloud_fn_desc" {
  type    = string
  default = "Cloud Function Gen 2 triggered by Pub/Sub for user verification"
}

variable "gcloud_fn_location" {
  type    = string
  default = "us-east1"
}

variable "gcloud_fn_entry_pt" {
  type    = string
  default = "helloPubSub"
}

variable "gcloud_fn_runtime" {
  type    = string
  default = "nodejs20"
}

variable "gcloud_fn_serv_config_mem" {
  type    = string
  default = "128Mi"
}

variable "gcloud_fn_serv_config_timeout" {
  type    = number
  default = 60
}


variable "gcloud_fn_serv_config_ingress" {
  type    = string
  default = "ALLOW_ALL"
}

variable "gcloud_fn_serv_config_egress" {
  type    = string
  default = "PRIVATE_RANGES_ONLY"
}

variable "gcloud_fn_event_trigger_type" {
  type    = string
  default = "google.cloud.pubsub.topic.v1.messagePublished"
}

variable "gcloud_fn_event_trigger_retry" {
  type    = string
  default = "RETRY_POLICY_RETRY"
}

variable "serverless_service_acc" {
  type    = string
  default = "serverless-service-account"
}

variable "serverless_service_acc_display_name" {
  type    = string
  default = "Service Account for serverless cloud function"
}

variable "ser_acc_pubsub_scope" {
  type    = string
  default = "https://www.googleapis.com/auth/pubsub"
}

variable "serverless_vpc_conn_name" {
  type    = string
  default = "my-serverless-connector"
}

variable "serverless_vpc_conn_region" {
  type    = string
  default = "us-east1"
}

variable "serverless_vpc_conn_ip_cidr" {
  type    = string
  default = "10.0.2.0/28"
}

variable "ssl_certificate_name" {
  type    = string
  default = "ssl-cert"
}

variable "gcp_reserved_ip_range_1" {
  type    = string
  default = "130.211.0.0/22"
}

variable "gcp_reserved_ip_range_2" {
  type    = string
  default = "35.191.0.0/16"
}

variable "region_health_check_name" {
  type    = string
  default = "https-region-health-check"
}

variable "https_region_health_check_zone" {
  type    = string
  default = "us-east1"
}

variable "health_check_endpoint" {
  type    = string
  default = "/healthz"
}
variable "health_check_port" {
  type    = string
  default = "3000"
}

variable "health_check_name" {
  type    = string
  default = "https-health-check"
}

variable "instance_template_region" {
  type    = string
  default = "us-east1"
}

variable "instance_template_boot_disk" {
  type    = bool
  default = true
}

variable "ser_acc_cloud_platform_scope" {
  type    = string
  default = "cloud-platform"
}

variable "load_balancer_backend_name" {
  type    = string
  default = "load-balancer-backend"
}

variable "lb_connection_draining" {
  type    = number
  default = 0
}

variable "lb_load_balancing_scheme" {
  type    = string
  default = "EXTERNAL_MANAGED"
}

variable "lb_port_name" {
  type    = string
  default = "http"
}

variable "lb_protocol" {
  type    = string
  default = "HTTP"
}

variable "lb_session_affinity" {
  type    = string
  default = "NONE"
}

variable "lb_timeout_sec" {
  type    = number
  default = 30
}

variable "lb_be_balancing_mode" {
  type    = string
  default = "UTILIZATION"
}

variable "lb_be_capacity_scaler" {
  type    = number
  default = 1.0
}

variable "lb_be_max_utilization" {
  type    = number
  default = 0.8
}

variable "lb_log_enabled" {
  type    = bool
  default = true
}

variable "gc_url_map_name" {
  type    = string
  default = "web-app-https"
}

variable "target_https_proxy_name" {
  type    = string
  default = "https-lb-proxy"
}

variable "global_fw_rule_name" {
  type    = string
  default = "https-fw-rule"
}

variable "global_fw_rule_ip_protocol" {
  type    = string
  default = "TCP"
}

variable "global_fw_rule_lb_scheme" {
  type    = string
  default = "EXTERNAL_MANAGED"
}

variable "global_fw_rule_port_range" {
  type    = string
  default = "443"
}

variable "instance_group_mgr_name" {
  type    = string
  default = "my-mig"
}

variable "instance_group_mgr_zone" {
  type    = string
  default = "us-east1"
}

variable "instance_group_dis_policy_1" {
  type    = string
  default = "us-east1-b"
}

variable "instance_group_dis_policy_2" {
  type    = string
  default = "us-east1-c"
}

variable "instance_group_base_ins_name" {
  type    = string
  default = "base-instance"
}

variable "auto_healing_delay_sec" {
  type    = number
  default = 300
}

variable "named_port_name" {
  type    = string
  default = "http"
}

variable "named_port" {
  type    = number
  default = 3000
}

variable "auto_scaler_name" {
  type    = string
  default = "my-autoscaler"
}

variable "autoscaling_policy_max_replicas" {
  type    = number
  default = 6
}

variable "autoscaling_policy_min_replicas" {
  type    = number
  default = 3
}

variable "autoscaling_policy_cooldown" {
  type    = number
  default = 240
}

variable "auto_scaling_policy_cpu_utilization" {
  type    = number
  default = 0.05
}