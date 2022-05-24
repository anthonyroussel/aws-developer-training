variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "number_of_instances" {
  default = 3
}

variable "public_subnets" {
  type = map(any)
  default = {
    primary = {
      az   = "euw3-az1"
      cidr = "10.0.200.0/24"
    }
    secondary = {
      az   = "euw3-az2"
      cidr = "10.0.210.0/24"
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    primary = {
      az   = "euw3-az1"
      cidr = "10.0.100.0/24"
    }
    secondary = {
      az   = "euw3-az2"
      cidr = "10.0.110.0/24"
    }
  }
}
