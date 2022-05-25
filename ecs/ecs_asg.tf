resource "aws_launch_template" "web" {
  name = "ECSLaunchTemplate"

  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  user_data     = filebase64("${path.module}/ecs_ec2_user_data.sh")

  iam_instance_profile {
    arn = aws_iam_instance_profile.ecs_instance_role.arn
  }
}

resource "aws_autoscaling_group" "ecs" {
  name = "Infra-ECS-Cluster-ECSAutoScalingGroup"

  vpc_zone_identifier = module.vpc.private_subnet_ids

  desired_capacity = 0
  max_size         = 1
  min_size         = 0

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["591542846629"]
}
