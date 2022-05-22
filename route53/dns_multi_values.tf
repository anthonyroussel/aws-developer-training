resource "aws_route53_record" "multi_us" {
  zone_id                          = data.aws_route53_zone.selected.zone_id
  name                             = "multi"
  type                             = "A"
  ttl                              = "60"
  multivalue_answer_routing_policy = true
  health_check_id                  = aws_route53_health_check.us_east.id

  set_identifier = "US EAST"

  records = [module.us_east.instance_ip]
}

resource "aws_route53_record" "multi_eu" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "multi"
  type    = "A"
  ttl     = "60"

  multivalue_answer_routing_policy = true
  health_check_id                  = aws_route53_health_check.eu_west.id

  set_identifier = "EU"

  records = [module.eu_west.instance_ip]
}

resource "aws_route53_record" "multi_ap" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "multi"
  type    = "A"
  ttl     = "60"

  multivalue_answer_routing_policy = true
  health_check_id                  = aws_route53_health_check.ap_southeast.id


  set_identifier = "SOUTHEAST"

  records = [module.ap_southeast.instance_ip]
}
