variable "cidr_blocks_ingress" {
    default = ["10.0.0.0/8","172.16.0.0/12","192.168.0.0/16"]
  
}

variable "cidr_blocks_egress" {
    default = ["0.0.0.0/0"]
  
}

variable "aws_region" {
    default = "ap-south-1"
    description = "aws_region"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
  
}

variable "kubernetes_version" {
    default = 1.27
     
}

variable "private_subnets" {

    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
}

variable "public_subnets" {
    default = ["10.0.4.0/24", "10.0.6.0/24", "10.0.5.0/24"]
  }