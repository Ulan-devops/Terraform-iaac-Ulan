resource "aws_key_pair" "laptop" {
  key_name   = "laptop"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

