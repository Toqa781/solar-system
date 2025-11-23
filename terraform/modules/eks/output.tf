output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value =aws_eks_cluster.solar-system-cluster.endpoint
}

output "cluster_name" {
  value = aws_eks_cluster.solar-system-cluster.name
}