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

variable "external_ip_add_range" {
  type    = string
  default = "ipv4-address"
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