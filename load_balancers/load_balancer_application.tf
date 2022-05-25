resource "aws_lb" "application" {
  name               = "application"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.load_balancer.id]

  dynamic "subnet_mapping" {
    for_each = module.vpc.public_subnet_ids
    content {
      subnet_id = subnet_mapping.value
    }
  }

  tags = {
    Name = "ALB"
  }
}

resource "aws_lb_listener" "application_http" {
  load_balancer_arn = aws_lb.application.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_http_default.arn
  }
}

resource "aws_lb_target_group" "application_http_default" {
  name     = "default"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_listener_rule" "application_http_constant" {
  listener_arn = aws_lb_listener.application_http.arn
  priority     = 100

  action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Constant error response"
      status_code  = "400"
    }
  }

  condition {
    path_pattern {
      values = ["/constant"]
    }
  }
}

output "load_balancer_application_dns_name" {
  value = aws_lb.application.dns_name
}
