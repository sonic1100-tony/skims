terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "jyp-s3-tf-state"
    key = "jyp-eks/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "jyp-db-tf-lock"
    encrypt = "true"
  }
}


terraform {
  required_version = ">= 1.0"
}

provider "aws" {
  region = "ap-northeast-2"
}



