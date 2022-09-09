terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "skims-s3-tf-state"
    key            = "skims-ec2/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "skims-ddb-tf-lock"
    encrypt        = "true"
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-northeast-2a", "ap-northeast-2c"]
}


