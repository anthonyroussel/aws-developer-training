provider "aws" {
  region = "eu-west-3"

  default_tags {
    tags = {
      Project = "Udemy - Load Balancers"
    }
  }
}

module "vpc" {
  source = "../modules/vpc"
  region = "eu-west-3"
}
