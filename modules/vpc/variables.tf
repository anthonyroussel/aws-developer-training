variable "region" {
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
    tertiary = {
      az   = "euw3-az3"
      cidr = "10.0.220.0/24"
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
    tertiary = {
      az   = "euw3-az3"
      cidr = "10.0.120.0/24"
    }
  }
}
