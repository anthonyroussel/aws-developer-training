# EC2 instance

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
| [aws_autoscaling_group.web](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.web](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/launch_template) | resource |
| [aws_lb.application](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/lb) | resource |
| [aws_lb_listener.application_http](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.application_http_constant](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.application_http_default](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/lb_target_group) | resource |
| [aws_security_group.load_balancer](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/security_group) | resource |
| [aws_security_group.web](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/security_group) | resource |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS access key | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS secret key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_application_dns_name"></a> [load\_balancer\_application\_dns\_name](#output\_load\_balancer\_application\_dns\_name) | n/a |
<!-- END_TF_DOCS -->