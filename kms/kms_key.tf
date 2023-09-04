resource "aws_kms_key" "tutorial" {
  description = "KMS key for tutorial"
  key_usage   = "ENCRYPT_DECRYPT"
}

resource "aws_kms_alias" "tutorial" {
  name          = "alias/tutorial"
  target_key_id = aws_kms_key.tutorial.key_id
}

resource "aws_kms_key_policy" "tutorial" {
  key_id = aws_kms_key.tutorial.id
  policy = jsonencode({
    Id = "tutorial"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Resource = "*"
        Sid      = "Enable IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
}
