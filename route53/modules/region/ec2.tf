resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  user_data     = <<EOF
    #!/usr/bin/env bash
    sudo yum update -y
    sudo amazon-linux-extras install nginx1 -y
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EC2_AVAILABILITY_ZONE=$(curl -sS http://169.254.169.254/latest/meta-data/placement/availability-zone)
    echo "<h1>Hello World from $(hostname -f) in AZ $EC2_AVAILABILITY_ZONE</h1>" > /usr/share/nginx/html/index.html
  EOF
  security_groups = [
    aws_security_group.security_group.name
  ]

  tags = {
    Name = "Udemy"
  }
}

output "instance_ip" {
  value       = aws_instance.web.public_ip
  description = "Instance Public IP"
}
