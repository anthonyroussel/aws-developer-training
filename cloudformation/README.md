# CloudFormation

## Deploy stack

```shell
aws cloudformation create-stack \
  --stack-name training-ec2-01 \
  --template-body file://cloudformation/ec2-01-template.yaml
```

And with parameters:

```shell
aws cloudformation create-stack \
  --stack-name training-ec2-02 \
  --template-body file://cloudformation/ec2-02-template.yaml \
  --parameters ParameterKey=SecurityGroupDescription,ParameterValue=MyCoolSecurityGroup
```

## Delete stack

```shell
aws cloudformation delete-stack --stack-name training-ec2-01
```

## :warning: Warnings

* The stack name must satisfy regular expression pattern: `[a-zA-Z][-a-zA-Z0-9]*` (no underscore)
