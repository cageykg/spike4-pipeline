terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "tabi-terraformpipeline"
    key    = "SPIKE4/dev/TEAM1/vpc/terraform.tfstate"
    profile = "developmentaws"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "developmentaws"
}

module "vpc" {
  source     = "../../../../modules/network/vpc"
  vpc_name   = "DEV-TEAM1"
  cidr_block = "10.1.0.0/16"
}
