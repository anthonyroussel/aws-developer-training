provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Project = "Udemy ECS"
    }
  }
}

module "vpc" {
  source = "../modules/vpc"
  region = "eu-west-3"
}
