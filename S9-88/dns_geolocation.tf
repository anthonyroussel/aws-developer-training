resource "aws_route53_record" "geolocation_us" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "geo"
  type    = "A"
  ttl     = "300"

  geolocation_routing_policy {
    country = "US"
  }

  set_identifier = "US EAST"

  records = [module.us_east.instance_ip]
}

resource "aws_route53_record" "geolocation_eu" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "geo"
  type    = "A"
  ttl     = "300"

  geolocation_routing_policy {
    country = "*"
  }

  set_identifier = "EU"

  records = [module.eu_west.instance_ip]
}

resource "aws_route53_record" "geolocation_ap" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "geo"
  type    = "A"
  ttl     = "300"

  geolocation_routing_policy {
    continent = "AS"
  }

  set_identifier = "SOUTHEAST"

  records = [module.ap_southeast.instance_ip]
}
