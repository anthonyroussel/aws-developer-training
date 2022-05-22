resource "aws_route53_health_check" "eu_west" {
  ip_address       = module.eu_west.instance_ip
  port             = 80
  type             = "HTTP"
  resource_path    = "/"
  request_interval = "30"

  tags = {
    Name = "eu_west"
  }
}

resource "aws_route53_health_check" "us_east" {
  ip_address       = module.us_east.instance_ip
  port             = 80
  type             = "HTTP"
  resource_path    = "/"
  request_interval = "30"

  tags = {
    Name = "us_east"
  }
}

resource "aws_route53_health_check" "ap_southeast" {
  ip_address       = module.ap_southeast.instance_ip
  port             = 80
  type             = "HTTP"
  resource_path    = "/"
  request_interval = "30"

  tags = {
    Name = "ap_southeast"
  }
}
