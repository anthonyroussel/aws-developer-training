data "aws_iam_policy" "ecs_instance_role" {
  name = "AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role" "ecs_instance_role" {
  name               = "udemy-ecsInstanceRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = data.aws_iam_policy.ecs_instance_role.arn
}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  name = "udemy-ecsInstanceRole"
  role = aws_iam_role.ecs_instance_role.name
}
