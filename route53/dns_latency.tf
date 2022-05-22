resource "aws_route53_record" "latency_us" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "latency"
  type    = "A"
  ttl     = "300"

  latency_routing_policy {
    region = "us-east-1"
  }

  set_identifier = "US EAST"

  records = [module.us_east.instance_ip]
}

resource "aws_route53_record" "latency_eu" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "latency"
  type    = "A"
  ttl     = "300"

  latency_routing_policy {
    region = "eu-west-3"
  }

  set_identifier = "EU"

  records = [module.eu_west.instance_ip]
}

resource "aws_route53_record" "latency_ap" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "latency"
  type    = "A"
  ttl     = "300"

  latency_routing_policy {
    region = "ap-southeast-1"
  }

  set_identifier = "SOUTHEAST"

  records = [module.ap_southeast.instance_ip]
}
