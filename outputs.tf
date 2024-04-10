output "cluster_id" {
    description = "eks cluster id"
    value = module.eks.cluster_id

}

output "name" {
    value = module.vpc.name
  }


output "aws_region" {
    value = var.aws_region  
}

output "cluster_security_group_id" {
    value = module.eks.cluster_security_group_id
  
}
