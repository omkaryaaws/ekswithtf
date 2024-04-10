resource "aws_secuirty_group" "all_worker_mgmt" {
    name_prefix = "all_worker_management"
    vpc_id = module.vpc.vpc_id
}



resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
    description     = "allow traffic from eks"
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_group_id = aws.security_group.all_worker_mgmt.vpc_id
    type              = "ingress"
    cidr_blocks = var.cidr_blocks_ingress #["10.0.0.0/8","172.16.0.0/12","192.168.0.0/16"]

}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {
    description = "allow outbound"
    from_port = 0
    protocol = "-1"
    to_port = 0
    security_group_id = aws_secuirty_group.all_worker_mgmt.vpc_id
    type = "egress"
    cidr_blocks = var.cidr_blocks_egress
}
