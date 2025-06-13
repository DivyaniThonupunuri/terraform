 resource "aws_route53_record" "www" {
   for_each = aws_instance.Roboshop
  zone_id = var.zone_ID
  name    = "${each.key}.${var.domain_name}" #devsecops-dt.site
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true  


} 