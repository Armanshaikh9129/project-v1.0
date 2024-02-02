resource "aws_key_pair" "MY_SSH_KEY" {
  key_name   = var.M_KEY_NAME
  public_key = var.M_KEY_PAIR
}