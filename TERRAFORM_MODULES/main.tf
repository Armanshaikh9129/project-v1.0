module "ec2_instance_module" {
  source = "./modules/EC2"
  m_ami = var.p_ami
  m_instance_type = var.p_instance_type
  m_availability = var.p_availability
  m_ins_name = var.p_ins_name
  m_SG = [var.p_security_group_name]
  m_keyname = module.SSH_KEY.SSH
}

module "Security__group"{
 source = "./modules/SECURITY-GROUP"
 m_port = var.p_port
 m_cidr_value = var.p_cidr_value
 m_SG = var.p_security_group_name
}

module "SSH_KEY" {
  source = "./modules/SSH-KEY"
  M_KEY_NAME = var.P_KEY_NAME
  M_KEY_PAIR = file(var.P_KEY_PAIR)
}
