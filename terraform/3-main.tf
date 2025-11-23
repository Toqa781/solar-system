module "vpc" {
  source               = "./modules/vpc"
  availability_zones   = var.availability_zones
  cluster_name         = var.cluster_name
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  node_groups     = var.node_groups
  vpc_id          = module.vpc.vpc_id
  subnets_id      = module.vpc.private_subnet_ids
}