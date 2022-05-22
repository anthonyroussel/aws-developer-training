resource "aws_route53_record" "failover_primary" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "failover"
  type    = "A"
  ttl     = "60"

  failover_routing_policy {
    type = "PRIMARY"
  }
  health_check_id = aws_route53_health_check.eu_west.id

  set_identifier = "EU"

  records = [module.eu_west.instance_ip]
}

resource "aws_route53_record" "failover_secondary" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "failover"
  type    = "A"
  ttl     = "60"

  failover_routing_policy {
    type = "SECONDARY"
  }
  health_check_id = aws_route53_health_check.us_east.id

  set_identifier = "US EAST"

  records = [module.us_east.instance_ip]
}
