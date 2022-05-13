# IAM Password policies

Update the organization's password policy to enforce symbols and numbers in passwords:

```bash
$ aws iam update-account-password-policy --require-symbols --require-numbers
```
