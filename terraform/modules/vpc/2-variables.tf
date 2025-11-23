variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "cidr block of the vpc"
  type = string
}

variable "cluster_name" {
  type = string
}

variable "availability_zones" {
  description = "availability zones"
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "cidrs of private subnets"
  type = list(string)
}

variable "public_subnet_cidrs" {
  description = "cidrs of public subnets"
  type = list(string)
}

