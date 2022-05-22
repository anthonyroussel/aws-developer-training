data "aws_vpc" "selected" {
  default = true
}

resource "aws_security_group" "security_group" {
  name   = "security_group"
  vpc_id = data.aws_vpc.selected.id

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
    Name = "Udemy"
  }
}
