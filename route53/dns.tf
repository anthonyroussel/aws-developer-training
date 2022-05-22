data "aws_route53_zone" "selected" {
  name = "aws.roussel.dev."
}

# https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html
#
resource "aws_route53_record" "myapp" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "myapp"
  type    = "CNAME"
  ttl     = "300"

  # CNAME records can only contain 1 resource record
  records = [
    module.eu_west.load_balancer_dns_name
  ]
}

resource "aws_route53_record" "myalias" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "myalias"
  type    = "A"

  # TTL for all alias records is 60 seconds, you cannot change this.
  # Therefore ttl has to be omitted in alias records.

  # You can only define a single alias target per record
  alias {
    name                   = module.eu_west.load_balancer_dns_name
    zone_id                = module.eu_west.load_balancer_zone_id
    evaluate_target_health = true
  }
}
