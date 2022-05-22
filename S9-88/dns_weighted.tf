resource "aws_route53_record" "weighted_us" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "weighted"
  type    = "A"
  ttl     = "3"

  weighted_routing_policy {
    weight = 70
  }

  set_identifier = "US EAST"

  records = [module.us_east.instance_ip]
}

resource "aws_route53_record" "weighted_eu" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "weighted"
  type    = "A"
  ttl     = "3"

  weighted_routing_policy {
    weight = 20
  }

  set_identifier = "EU"

  records = [module.eu_west.instance_ip]
}

resource "aws_route53_record" "weighted_ap" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "weighted"
  type    = "A"
  ttl     = "3"

  weighted_routing_policy {
    weight = 10
  }

  set_identifier = "SOUTHEAST"

  records = [module.ap_southeast.instance_ip]
}
