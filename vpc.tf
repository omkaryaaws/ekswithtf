provider "aws" {
    region = var.aws_region
  }

data "aws_availability_zones" "available" {}

resource "random_string" "suffix" {
    length = 8
    special = false
  }

locals {
  cluster_name = "omkarya-eks-${random_string.suffix.result}"
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name = "omkarya-eks-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names #["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway    = true
  enable_vpn_gateway    = true
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    Environment = "dev"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}