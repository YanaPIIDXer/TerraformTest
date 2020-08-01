provider "aws" {
  version = "~> 2.0"
  region  = "ap-northeast-1"
}

module "vpc" {
  source = "./VPC"
}

module "public_subnet" {
  source = "./Subnet"
  vpc_id = module.vpc.vpc_id
}
