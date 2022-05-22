data "aws_route53_zone" "selected" {
  name = "aws.roussel.dev."
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = [
    module.eu_west.instance_ip,
    module.us_east.instance_ip,
    module.ap_southeast.instance_ip
  ]
}
