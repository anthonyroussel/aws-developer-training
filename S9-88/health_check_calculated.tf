resource "aws_route53_health_check" "calculated" {
  type = "CALCULATED"

  child_health_threshold = 3
  child_healthchecks = [
    aws_route53_health_check.eu_west.id,
    aws_route53_health_check.us_east.id,
    aws_route53_health_check.ap_southeast.id
  ]

  tags = {
    Name = "calculated"
  }
}
