provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source     = "YanaPIIDXer/vpc/aws"
  name       = "TerraformTest"
  cidr_block = "30.0.0.0/16"
}
