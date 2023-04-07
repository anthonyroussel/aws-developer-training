# IAM Users & Groups

## Create a user

Create a user:

```bash
$ aws iam create-user --user-name anthony
```

Create an AWS Login profile (access to the AWS Console) for this user with a password:

```bash
$ aws iam create-login-profile --user-name anthony --password P4ssw0rd123
```

Tag the user:

```bash
aws iam tag-user --user-name anthony --tags '{"Key": "department", "Value": "Engineering"}'
```

## Create a group

Create a group:

```bash
$ aws iam create-group --group-name admin
```

List policies available, search for the `AdministratorAccess` and copy its `Arn` value:

```bash
$ aws iam list-policies
[
  {
    "PolicyName": "AdministratorAccess",
    "PolicyId": "ANPAIWMBCKSKIEE64ZLYK",
    "Arn": "arn:aws:iam::aws:policy/AdministratorAccess",
    "Path": "/",
    "DefaultVersionId": "v1",
    "AttachmentCount": 1,
    "PermissionsBoundaryUsageCount": 0,
    "IsAttachable": true,
    "CreateDate": "2015-02-06T18:39:46+00:00",
    "UpdateDate": "2015-02-06T18:39:46+00:00"
  }
]
```

```bash
$ aws iam attach-group-policy --group-name admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

Add anthony to the admin group:

```bash
$ aws iam add-user-to-group --user-name anthony --group-name admin
```

## Login with the IAM user

Create an account alias to generate a login page URL to the AWS Console:

```bash
aws iam create-account-alias --account-alias aroussel
```

The login page is now located at: https://aroussel.signin.aws.amazon.com/console