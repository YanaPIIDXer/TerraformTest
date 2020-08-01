provider "aws" {
  version = "~> 2.0"
  region  = "ap-northeast-1"
}

module "vpc" {
  source = "./VPC"
  cidr_block = "10.0.0.0/16"
  public_subnets = [
      {
          cidr_block = "10.0.1.0/24"
          availability_zone = "ap-northeast-1a"
      }
  ]
  private_subnets = [
      {
          cidr_block = "10.0.2.0/24"
          availability_zone = "ap-northeast-1a"
      },
      {
          cidr_block = "10.0.3.0/24"
          availability_zone = "ap-northeast-1c"
      }
  ]
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
  source      = "./SecurityGroup"
  vpc_id      = module.vpc.vpc_id
  enable_ssh  = true
  enable_http = true
}

variable "key_name" {}

module "ec2" {
  source          = "./EC2"
  subnet          = module.vpc.public_subnets[0]
  security_groups = [module.security_group.id]
  user_data       = file("./setup_server.sh")
  key_name        = var.key_name
}

module "s3_bucket_public" {
    source = "./S3"
    bucket = "yanap-terraform-test-public"
    acl = "public-read"
}

module "s3_bucket_private" {
    source = "./S3"
    bucket = "yanap-terraform-test-private"
    acl = "private"
}

module "rds_security_group" {
  source      = "./SecurityGroup"
  vpc_id      = module.vpc.vpc_id
  enable_mysql = true
}

module "rds" {
    source = "./RDS"
    // HACK:サブネットのリソースそのものではなくＩＤの指定に統一する。
    subnets = [
        module.vpc.private_subnets[0].id,
        module.vpc.private_subnets[1].id
    ]
    db_name = "wordpress"
    security_groups = [module.rds_security_group.id]
}
