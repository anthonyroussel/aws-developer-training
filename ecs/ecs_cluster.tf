resource "aws_ecs_cluster" "main" {
  name = "udemy"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = aws_ecs_cluster.main.name

  capacity_providers = [
    "FARGATE_SPOT",
    # aws_ecs_capacity_provider.main.id
  ]

  # default_capacity_provider_strategy {
  #   base              = 1
  #   weight            = 100
  #   capacity_provider = aws_ecs_capacity_provider.main.name
  # }
}

# resource "aws_ecs_capacity_provider" "main" {
#   name = "udemy"

#   auto_scaling_group_provider {
#     auto_scaling_group_arn = aws_autoscaling_group.ecs.arn
#     managed_termination_protection = "ENABLED"

#     managed_scaling {
#       maximum_scaling_step_size = 1000
#       minimum_scaling_step_size = 1
#       status                    = "ENABLED"
#       target_capacity           = 2
#     }
#   }
# }

data "aws_ssm_parameter" "ecs_recommended_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}

locals {
  ecs_image_id = jsondecode(data.aws_ssm_parameter.ecs_recommended_ami.value).image_id
}
