resource "aws_security_group" "my_security_group" {
  name        = var.m_SG

    egress {
    from_port        = var.m_port
    to_port          = var.m_port
    protocol         = "0"
    cidr_blocks      = [var.m_cidr_value]
  
}
    ingress {
    from_port        = var.m_port
    to_port          = var.m_port
    protocol         = "0"
    cidr_blocks = [var.m_cidr_value]
  }
}
