resource "aws_ecs_service" "nginxdemos" {
  name = "nginxdemos"

  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.nginxdemos.arn
  desired_count   = 3
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = module.vpc.private_subnet_ids
    security_groups  = [aws_security_group.nginxdemos_service.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.nginxdemos.arn
    container_name   = "nginxdemos-hello"
    container_port   = 80
  }
}

resource "aws_security_group" "nginxdemos_service" {
  name   = "nginxdemos-service"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.nginxdemos_load_balancer.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
