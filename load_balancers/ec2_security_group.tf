resource "aws_security_group" "udemy_web" {
  name   = "udemy-lbl-web-instance"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description     = "HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.classic.id]
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
