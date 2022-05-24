resource "aws_elb" "classic" {
  name = "classic"

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    interval            = 5
    timeout             = 4
    healthy_threshold   = 2
    unhealthy_threshold = 2
    target              = "HTTP:80/"
  }

  instances                   = [aws_instance.web.id]
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 300

  subnets         = [aws_subnet.public.id]
  security_groups = [aws_security_group.classic.id]

  tags = {
    Name = "Udemy LBL"
  }
}

resource "aws_security_group" "classic" {
  name   = "classic"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Udemy LBL"
  }
}

output "load_balancer_classic_dns_name" {
  value       = aws_elb.classic.dns_name
  description = "Instance Public IP"
}
