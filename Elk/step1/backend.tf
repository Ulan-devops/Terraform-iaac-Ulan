terraform {
   backend "s3" {
    bucket = "eksnew"
    region = "us-east-1"
    key    = "elkkey"
  }
}

