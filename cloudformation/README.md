# CloudFormation

## Deploy stack

```shell
aws cloudformation create-stack \
  --stack-name training-ec2 \
  --template-body file://cloudformation/ec2-01-template.yaml
```

And with parameters:

```shell
aws cloudformation create-stack \
  --stack-name training-ec2 \
  --template-body file://cloudformation/ec2-02-template.yaml \
  --parameters ParameterKey=SecurityGroupDescription,ParameterValue=MyCoolSecurityGroup
```

## Update existing stack

Use update stack for immediate deployment:

```shell
aws cloudformation update-stack \
  --stack-name training-ec2 \
  --template-body file://cloudformation/ec2-02-template.yaml \
  --parameters ParameterKey=SecurityGroupDescription,ParameterValue=MyCoolSecurityGroup
```

## Create change set to update existing stack

Use change sets to prepare changes and review them before deploying them.

```shell
aws cloudformation create-change-set \
  --stack-name training-ec2 \
  --change-set-name training-ec2-002 \
  --template-body file://cloudformation/ec2-02-template.yaml \
  --parameters ParameterKey=SecurityGroupDescription,ParameterValue=MyCoolSecurityGroup
```

And the execute the change set:

```shell
aws cloudformation execute-change-set \
  --stack-name training-ec2 \
  --change-set-name training-ec2-002
```

## Delete stack

```shell
aws cloudformation delete-stack --stack-name training-ec2
```

## :warning: Warnings

* The stack name must satisfy regular expression pattern: `[a-zA-Z][-a-zA-Z0-9]*` (no underscore)
