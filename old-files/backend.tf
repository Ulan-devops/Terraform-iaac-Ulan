terraform {
  backend "s3" {
    bucket = "backend-state-ulan"
    key    = "infrastructure"
    region = "us-east-1"
  }
}