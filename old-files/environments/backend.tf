terraform {
  backend "s3" {
    bucket = "terraform-us-ulan"
    key    = "aws/ec2/ec2_state"
    region = "us-east-1"
  }
}