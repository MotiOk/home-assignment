##### THIS FILE MANAGES ALL ROUTE53-RELATED RESOURCES #####
###################  hosted zones #####################
resource "aws_route53_zone" "main" {
  name = var.HOSTEZ_ZONE_NAME
}

######################  records ########################
resource "aws_route53_record" "main_elb_cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.MAIN_ELB_CNAME_SUBDOMAIN}.${var.HOSTEZ_ZONE_NAME}"
  type    = "CNAME"
  ttl     = "300"

  records = [
    aws_lb.main.dns_name
  ]
}
