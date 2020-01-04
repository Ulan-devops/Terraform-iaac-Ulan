terraform {
  backend "s3" {
    bucket = "backend-state-ulan"
    key    = "aws/iam/iam_state"
    region = "us-west-1"
  }
}