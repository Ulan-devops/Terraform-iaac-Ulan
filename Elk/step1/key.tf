resource "aws_key_pair" "elkkey" {
  key_name   = "elkkey"
  public_key = file("~/.ssh/id_rsa.pub")
}

