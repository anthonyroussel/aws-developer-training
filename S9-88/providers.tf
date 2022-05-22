provider "aws" {
  alias  = "eu_west"
  region = "eu-west-3"
}

module "eu_west" {
  source = "./modules/region"

  providers = {
    aws = aws.eu_west
  }
}

provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}

module "us_east" {
  source = "./modules/region"

  providers = {
    aws = aws.us_east
  }
}

provider "aws" {
  alias  = "ap_southeast"
  region = "ap-southeast-1"
}

module "ap_southeast" {
  source = "./modules/region"

  providers = {
    aws = aws.ap_southeast
  }
}
