variable "vpc_cidr" {
  type = string
}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)

}
variable "availability_zones" {
  type = list(string)
}
variable "cluster_name" {
  type = string
}
variable "cluster_version" {
  type = string
}
variable "node_groups" {
  description = "EKS node groups configuration"
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
}