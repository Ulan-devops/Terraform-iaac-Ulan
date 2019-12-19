output "bucket_name" { 
    value = aws_s3_bucket.b.bucket
} 
output "aws_security_group" { 
    value = aws_security_group.allow_tls.name
} 
output "aws_key_pair" { 
    value = aws_key_pair.deployer.key_name
} 
output "username" { 
    value = "some_username"
} 
output "password" { 
    value = "password"
} 
output "wordpress" { 
    value = aws_route53_record.www.name
} 
output "wordpress_username" { 
    value = "some_username"
} 
output "wordpress_password" { 
    value = "password"
} 
output "IPs" { 
    value = "aws_instance.web.*.public_ip"
} 