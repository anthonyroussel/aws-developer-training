provider "aws" {
  alias  = "eu_west"
  region = "eu-west-3"

  default_tags {
    tags = {
      Project = "Udemy - CloudFront"
    }
  }
}
