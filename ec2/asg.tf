resource "aws_launch_template" "web" {
  name = "MyDemoTemplate"

  image_id               = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  user_data              = filebase64("${path.module}/launch.sh")
  vpc_security_group_ids = [aws_security_group.web.id]
}

resource "aws_autoscaling_group" "web" {
  name = "DemoASG"

  vpc_zone_identifier = module.vpc.private_subnet_ids

  desired_capacity = 3
  max_size         = 3
  min_size         = 1

  health_check_grace_period = 300
  health_check_type         = "ELB"

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.application_http_default.arn]
}
