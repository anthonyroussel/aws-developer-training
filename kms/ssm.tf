resource "aws_ssm_parameter" "database_url" {
  name        = "/my-app/dev/db-url"
  description = "Database URL for my app in development"
  type        = "String"
  value       = "database.roussel.dev:3306"
}

resource "random_password" "database_password" {
  length = 42
}

resource "aws_ssm_parameter" "database_password" {
  name        = "/my-app/dev/db-password"
  description = "Database password for my app in development"
  type        = "SecureString"
  value       = random_password.database_password.result
  key_id      = aws_kms_alias.tutorial.id
}
