resource "aws_route53_record" "simple" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "simple"
  type    = "A"
  ttl     = "20"

  records = [
    module.eu_west.instance_ip,
    module.us_east.instance_ip,
    module.ap_southeast.instance_ip
  ]
}
