terraform {
  backend "s3" {
    bucket = "terraform-us-ulan"
    key    = "aws/iam/iam_state"
    region = "us-east-1"
  }
}