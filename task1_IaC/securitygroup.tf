##### THIS FILE MANAGES ALL SECURITY GROUPS #####

# security group for the ELB named "main" #
resource "aws_security_group" "main-elb" {
  name   = "hw-main-elb"
  vpc_id = aws_vpc.main.id

  # Inbound rules
  dynamic "ingress" {
    for_each = var.MAIN_ELB_SG
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
