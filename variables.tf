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
  default     = 100
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
  type = string
  default = "servicenetworking.googleapis.com"
}

variable "google_compute_global_add_prefix_len" {
  type = number
  default = 16
} 

variable "random_string_len" {
  type = number
  default = 3
}

variable "google_sql_instance_name" {
  type = string
  default = "webapp-db-instance-"
}

variable "google_sql_instance_db_version" {
  type = string
  default = "MYSQL_8_0"
}

variable "google_sql_instance_tier" {
  type = string
  default = "db-f1-micro"
}

variable "google_sql_instance_avl_type" {
  type = string
  default = "REGIONAL"
}

variable "google_sql_instance_disk_type" {
  type = string
  default = "PD_SSD"
}

variable "google_sql_instance_disk_size" {
  type = number
  default = 100
}

variable "google_sql_database_name" {
  type = string
  default = "webapp"
}

variable "random_password_length" {
  type = number
  default = 8
}

variable "google_sql_database_user" {
  type = string
  default = "user1"
}