resource "aws_route53_record" "www" { 
  zone_id = "Z11HUQ2CPZZDNC" 
  name    = "www.ulan-best.com." 
  type    = "A" 
  ttl     = "60" 
  records = [aws_instance.web[0].public_ip]
  } 