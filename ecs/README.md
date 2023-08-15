<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.15.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.ecs](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/autoscaling_group) | resource |
| [aws_cloudwatch_log_group.nginxdemos](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_repository.nginxdemos](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/ecr_repository) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_service.nginxdemos](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.nginxdemos](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/ecs_task_definition) | resource |
| [aws_iam_instance_profile.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.web](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/launch_template) | resource |
| [aws_lb.nginxdemos](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/lb) | resource |
| [aws_lb_listener.nginxdemos](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.nginxdemos](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/lb_target_group) | resource |
| [aws_security_group.nginxdemos_load_balancer](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/security_group) | resource |
| [aws_security_group.nginxdemos_service](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/security_group) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/ami) | data source |
| [aws_iam_policy.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/iam_policy) | data source |
| [aws_ssm_parameter.ecs_recommended_ami](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS access key | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS secret key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_dns_name"></a> [load\_balancer\_dns\_name](#output\_load\_balancer\_dns\_name) | n/a |
<!-- END_TF_DOCS -->