data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

resource "aws_lb" "load_balancer" {
  name               = "demo-alb-route-53"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group.id]
  subnets            = [for id in data.aws_subnets.selected.ids : id]

  tags = {
    Name = "Udemy"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }

  tags = {
    Name = "Udemy HTTP"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "new-tg-route-53"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id

  tags = {
    Name = "Udemy HTTP Instance target"
  }
}

resource "aws_lb_target_group_attachment" "instance_attachment" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.web.id
  port             = 80
}

output "load_balancer_dns_name" {
  value       = aws_lb.load_balancer.dns_name
  description = "Load balancer DNS name"
}
