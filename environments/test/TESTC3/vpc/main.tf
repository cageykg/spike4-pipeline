terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "tabi-terraformpipeline"
    key    = "SPIKE4/test/TESTC3/vpc/terraform.tfstate"
    profile = "developmentaws"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "developmentaws"
}

module "vpc" {
  source     = "github.com/cageykg/spike4-pipeline//modules/network/vpc"
  vpc_name   = "TESTC3"
  cidr_block = "10.6.0.0/16"
}

module "dummy" {
  source     = "github.com/cageykg/spike4-pipeline//modules/network/dummy"
  vpc_name   = "TESTC3"
  cidr_block = "10.6.0.0/16"
}


