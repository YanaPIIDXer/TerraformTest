provider "aws" {
  version = "~> 2.0"
  region  = "ap-northeast-1"
}

module "vpc" {
  source = "./VPC"
}

module "route_table" {
  source               = "./RouteTable"
  vpc_id               = module.vpc.vpc_id
  subnets              = [module.vpc.public_subnets[0]]
  use_internet_gateway = true
  internet_gateway_id  = module.vpc.internet_gateway_id
}
