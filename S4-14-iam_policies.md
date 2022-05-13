# IAM Policies

## Policies

Remove a user from a group:

```bash
aws iam remove-user-from-group --user-name anthony --group-name admin
```

Get the Arn of the IAMReadOnlyAccess policy:

```
$ aws list-policies
[
  {
      "PolicyName": "IAMReadOnlyAccess",
      "PolicyId": "ANPAJKSO7NDY4T57MWDSQ",
      "Arn": "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
      "Path": "/",
      "DefaultVersionId": "v4",
      "AttachmentCount": 0,
      "PermissionsBoundaryUsageCount": 0,
      "IsAttachable": true,
      "CreateDate": "2015-02-06T18:40:39+00:00",
      "UpdateDate": "2018-01-25T19:11:27+00:00"
  }
]
```

Add the IAMReadOnlyAccess policy to the anthony user (inline policy):

```bash
$ aws iam attach-user-policy --user-name anthony --policy-arn arn:aws:iam::aws:policy/IAMReadOnlyAccess
```

Add anthony (back) to the admin group:

```bash
$ aws iam add-user-to-group --user-name anthony --group-name admin
```

Create a developers group:

```bash
$ aws iam create-group --group-name developers
```

Attach a random policy to this group:

```bash
$ aws iam attach-group-policy --group-name developers --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineApproverAccess
```

Add anthony to the developers group:

```bash
$ aws iam add-user-to-group --user-name anthony --group-name developers
```

## Policies

Create a custom IAM policy:

```
aws iam create-policy --policy-name my-policy --policy-document file://S4-14-iam_policies/policy.json
```

## Cleanup

Delete the custom IAM policy:

```bash
aws iam delete-policy --policy-arn arn:aws:iam::085148030565:policy/my-policy
```

Remove anthony from the developers group:

```bash
aws iam remove-user-from-group --user-name anthony --group-name developers
```

Detach the policies from the developers group:

```bash
aws iam detach-group-policy --group-name developers --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineApproverAccess
```

Delete the developers group:

```bash
aws iam delete-group --group-name developers
```

Remove the inline/direct policy on the anthony user:

```bash
$ aws iam detach-user-policy --user-name anthony --policy-arn arn:aws:iam::aws:policy/IAMReadOnlyAccess
```
