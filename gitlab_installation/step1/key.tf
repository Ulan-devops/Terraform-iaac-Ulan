resource "aws_key_pair" "ulans" {
  key_name   = "ulans"
  public_key = file("~/.ssh/id_rsa.pub")
}