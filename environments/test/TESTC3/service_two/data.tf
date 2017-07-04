data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    region = "eu-west-2"
    bucket = "tabi-terraformpipeline"  
    key = "SPIKE4/test/TESTC3/vpc/terraform.tfstate"
    profile = "developmentaws"
  }
}