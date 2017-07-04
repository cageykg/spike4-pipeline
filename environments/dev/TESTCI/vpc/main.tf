terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "tabi-terraformpipeline"
    key    = "SPIKE4/dev/TESTCI/vpc/terraform.tfstate"
    profile = "developmentaws"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "developmentaws"
}

module "vpc" {
  source     = "github.com/cageykg/spike4-pipeline//modules/network/vpc"
  vpc_name   = "TESTCI"
  cidr_block = "10.5.0.0/16"
}
