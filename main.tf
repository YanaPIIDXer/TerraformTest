provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source     = "YanaPIIDXer/vpc/aws"
  name       = "TerraformTest"
  cidr_block = "30.0.0.0/16"
}

module "public_subnet" {
  source     = "./Subnet"
  name       = "TerraformTest_Public"
  vpc_id     = module.vpc.vpc_id
  cidr_block = "30.0.1.0/24"
}

module "private_subnet" {
  source     = "./Subnet"
  name       = "TerraformTest_Private"
  vpc_id     = module.vpc.vpc_id
  cidr_block = "30.0.2.0/24"
}
