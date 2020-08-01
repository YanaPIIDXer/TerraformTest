provider "aws" {
  version = "~> 2.0"
  region  = "ap-northeast-1"
}

module "vpc" {
  source = "./VPC"
}

module "route_table" {
  source  = "./RouteTable"
  vpc_id  = module.vpc.vpc_id
  subnets = [module.vpc.public_subnets[0]]
  gateway_routes = [
    {
      id         = module.vpc.internet_gateway_id
      cidr_block = "0.0.0.0/0"
    }
  ]
}

module "security_group" {
  source     = "./SecurityGroup"
  vpc_id     = module.vpc.vpc_id
  enable_ssh = true
}

module "ec2" {
  source            = "./EC2"
  availability_zone = "ap-northeast-1a"
  subnet_id         = module.vpc.public_subnets[0].id
  security_groups   = [module.security_group.id]
}
