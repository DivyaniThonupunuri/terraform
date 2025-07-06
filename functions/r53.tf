 resource "aws_route53_record" "www" {
   count = 2
  zone_id = var.zone_ID
  name    = "${var.instance[count.index]}.${var.domain_name}" #devsecops-dt.site
  type    = "A"
  ttl     = 1
  records = [aws_instance.Roboshop[count.index].private_ip]
  allow_overwrite = true  


} 