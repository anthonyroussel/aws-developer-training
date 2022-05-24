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
