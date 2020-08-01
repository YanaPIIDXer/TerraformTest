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

variable "key_name" {}

module "ec2" {
  source          = "./EC2"
  subnet          = module.vpc.public_subnets[0]
  security_groups = [module.security_group.id]
  user_data       = <<USER_DATA
sudo yum install -y httpd
sudo systemctl enable httpd.service
sudo systemctl start httpd.service    
  USER_DATA
  key_name        = var.key_name
}
