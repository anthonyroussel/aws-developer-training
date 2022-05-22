resource "aws_route53_traffic_policy" "geoproximity" {
  name     = "DemoGeoPolicy"
  document = <<EOF
{
  "AWSPolicyFormatVersion": "2015-10-01",
  "RecordType": "A",
  "Endpoints": {
    "endpoint-geoproximity-tIIe": {
      "Type": "application-load-balancer",
      "Value": "demo-alb-route-53-1749905576.us-east-1.elb.amazonaws.com"
    },
    "endpoint-geoproximity-xiFv": {
      "Type": "application-load-balancer",
      "Value": "demo-alb-route-53-958726695.ap-southeast-1.elb.amazonaws.com"
    },
    "endpoint-geoproximity-JyhW": {
      "Type": "application-load-balancer",
      "Value": "demo-alb-route-53-757765367.eu-west-3.elb.amazonaws.com"
    }
  },
  "Rules": {
    "geoproximity-start-sfMN": {
      "RuleType": "geoproximity",
      "GeoproximityLocations": [
        {
          "Bias": 0,
          "Region": "aws:route53:us-east-1",
          "EvaluateTargetHealth": true,
          "EndpointReference": "endpoint-geoproximity-tIIe"
        },
        {
          "Bias": 0,
          "Region": "aws:route53:ap-southeast-1",
          "EvaluateTargetHealth": true,
          "EndpointReference": "endpoint-geoproximity-xiFv"
        },
        {
          "EndpointReference": "endpoint-geoproximity-JyhW",
          "Bias": 0,
          "Region": "aws:route53:eu-west-3",
          "EvaluateTargetHealth": true
        }
      ]
    }
  },
  "StartRule": "geoproximity-start-sfMN"
}
EOF
}
