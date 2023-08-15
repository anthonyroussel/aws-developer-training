# Route 53 Hosted zone

## Create public hosted zone

```bash
$ aws route53 create-hosted-zone --name aws.roussel.dev --caller-reference $(date '+%Y-%m-%d-%H:%I')
```

Outputs the Route53 authoritative name servers for the `aws.roussel.dev` zone:

```json
{
  "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/ZZZ",
  "HostedZone": {
    "Id": "/hostedzone/ZZZ",
    "Name": "aws.roussel.dev.",
    "CallerReference": "2022-05-22-06:06",
    "Config": {
      "PrivateZone": false
    },
    "ResourceRecordSetCount": 2
  },
  "ChangeInfo": {
    "Id": "/change/CCC",
    "Status": "PENDING",
    "SubmittedAt": "2022-05-22T04:59:37.953000+00:00"
  },
  "DelegationSet": {
    "NameServers": [
      "ns-125.awsdns-15.com",
      "ns-1168.awsdns-18.org",
      "ns-1820.awsdns-35.co.uk",
      "ns-572.awsdns-07.net"
    ]
  }
}
```

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
| <a name="module_ap_southeast"></a> [ap\_southeast](#module\_ap\_southeast) | ./modules/region | n/a |
| <a name="module_eu_west"></a> [eu\_west](#module\_eu\_west) | ./modules/region | n/a |
| <a name="module_us_east"></a> [us\_east](#module\_us\_east) | ./modules/region | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_health_check.ap_southeast](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_health_check) | resource |
| [aws_route53_health_check.calculated](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_health_check) | resource |
| [aws_route53_health_check.eu_west](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_health_check) | resource |
| [aws_route53_health_check.us_east](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_health_check) | resource |
| [aws_route53_record.failover_primary](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.failover_secondary](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.geolocation_ap](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.geolocation_eu](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.geolocation_us](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.latency_ap](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.latency_eu](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.latency_us](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.multi_ap](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.multi_eu](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.multi_us](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.myalias](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.myapp](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.simple](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.weighted_ap](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.weighted_eu](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_record.weighted_us](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_record) | resource |
| [aws_route53_traffic_policy.geoproximity](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/resources/route53_traffic_policy) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/5.12.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS access key | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS secret key | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->