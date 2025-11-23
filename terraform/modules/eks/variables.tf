variable "cluster_name" {
  default = "solar-system-cluster"
  type = string
  description = "EKS cluster's name"
}

variable "cluster_version" {
  description = "the version of the cluster"
  type = string
}

variable "vpc_id" {
  type = string
}
variable "subnets_id" {
  type = list(string)
}

variable "node_groups" {
  type = map(object({
    instance_types =list(string),
    capacity_type=string,
    scaling_config=object({
      desired_size = number,
      max_size=number,
      min_size=number
    }) 
  }))
}