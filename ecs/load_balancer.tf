resource "aws_lb" "nginxdemos" {
  name               = "nginxdemos"
  load_balancer_type = "application"

  security_groups = [aws_security_group.nginxdemos_load_balancer.id]
  subnets         = module.vpc.public_subnet_ids
}

resource "aws_lb_listener" "nginxdemos" {
  load_balancer_arn = aws_lb.nginxdemos.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginxdemos.arn
  }
}

resource "aws_lb_target_group" "nginxdemos" {
  name        = "nginxdemos"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group" "nginxdemos_load_balancer" {
  name   = "nginxdemos-load_balancer"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


output "load_balancer_dns_name" {
  value = aws_lb.nginxdemos.dns_name
}
