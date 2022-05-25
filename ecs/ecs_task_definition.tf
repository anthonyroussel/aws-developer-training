resource "aws_ecs_task_definition" "nginxdemos" {
  family = "nginxdemos-hello"

  # See https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "nginxdemos-hello"
      image     = "nginxdemos/hello"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-create-group  = "true"
          awslogs-group         = "/ecs/nginxdemos-hello"
          awslogs-region        = "eu-west-3"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_cloudwatch_log_group" "nginxdemos" {
  name = "/ecs/nginxdemos-hello"
}
