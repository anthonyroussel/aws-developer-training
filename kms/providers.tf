provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Project = "udemy-kms"
    }
  }
}
