variable "project_id" {
  description = "The name of the project in which resources will be provisioned"
}

variable "region" {
  description = "The region where resources will be provisioned"
}

variable "vpc_name" {
  description = "The name of the VPC"
}

variable "webapp_subnet_name" {
    description = "The name of the webapp subnet"
}

variable "db_subnet_name" {
    description = "The name of the db subnet"
}

variable "webapp_subnet_cidr" {
  description = "IP with CIDR range for webapp subnet"
}

variable "db_subnet_cidr" {
  description = "IP with CIDR range for db subnet"
}

variable "vpc_route_name" {
    description = "The name of the route for VPC"
}

variable "vpc_route_ip" {
  description = "The IP address of the VPC route"
}