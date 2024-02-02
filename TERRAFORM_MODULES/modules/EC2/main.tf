resource "aws_instance" "this_ec2_instance" {
  ami = var.m_ami
  instance_type = var.m_instance_type
  availability_zone = var.m_availability
  tags = {
    Name = var.m_ins_name
  }
}



