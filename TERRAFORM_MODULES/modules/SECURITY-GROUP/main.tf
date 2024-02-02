resource "aws_security_group" "my_security_group" {
  name        = "Security_hub"

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