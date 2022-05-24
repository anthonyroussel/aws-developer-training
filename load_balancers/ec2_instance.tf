resource "aws_instance" "web" {
  count = var.number_of_instances

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  user_data = <<EOF
    #!/usr/bin/env bash
    sudo yum update -y
    sudo amazon-linux-extras install nginx1 -y
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EC2_AVAILABILITY_ZONE=$(curl -sS http://169.254.169.254/latest/meta-data/placement/availability-zone)
    echo "<h1>Hello World from $(hostname -f) in AZ $EC2_AVAILABILITY_ZONE</h1>" > /usr/share/nginx/html/index.html
  EOF

  vpc_security_group_ids = [aws_security_group.web.id]

  subnet_id                   = aws_subnet.private["primary"].id
  associate_public_ip_address = false

  # NAT Gateway should be created first to install nginx
  depends_on = [
    aws_nat_gateway.public
  ]

  tags = {
    Name = "Udemy LBL Web instance ${count.index}"
  }
}
