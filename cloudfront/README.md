<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_key_group.signer](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/cloudfront_key_group) | resource |
| [aws_cloudfront_origin_access_identity.example](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_cloudfront_public_key.signer](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/cloudfront_public_key) | resource |
| [aws_s3_bucket.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_object.html](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/s3_object) | resource |
| [aws_s3_object.images](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/s3_object) | resource |
| [aws_cloudfront_cache_policy.caching_optimized](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/cloudfront_cache_policy) | data source |
| [aws_iam_policy_document.s3_policy](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS access key | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS secret key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | n/a |
<!-- END_TF_DOCS -->