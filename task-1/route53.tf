resource "aws_route53_record" "www" { 
  zone_id = "Z037571614TB3EDBQS25H" 
  name    = "gbeksbaby.com" 
  type    = "A" 
  ttl     = "300" 
  records = ["${aws_instance.web.public_ip}"]
} 