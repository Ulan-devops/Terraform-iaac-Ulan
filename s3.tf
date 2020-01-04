resource "aws_s3_bucket" "b" { 
  bucket = "test-bucket-ulan" 
  acl    = "private" 

  tags = { 
    Name        = "My bucket" 
    Environment = "Dev" 
  } 
    versioning { 
    enabled = true 
  } 
} 
