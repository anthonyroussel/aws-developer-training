resource "aws_ecr_repository" "nginxdemos" {
  name                 = "nginxdemos"
  image_tag_mutability = "MUTABLE"
}
