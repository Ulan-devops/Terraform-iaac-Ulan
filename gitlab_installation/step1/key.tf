resource "aws_key_pair" "ulans" {
  key_name   = "ulans"
  public_key = file("/ssh_keys/app_rsa.pub")
}
