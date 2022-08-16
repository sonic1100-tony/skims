resource "aws_s3_bucket" "jyp-s3-tf-state" {

  bucket = "jyp-s3-tf-state"

  tags = {
    "Name" = "jyp-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "jyp-db-tf-lock" {

  depends_on   = [aws_s3_bucket.jyp-s3-tf-state]
  name         = "jyp-db-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "jyp-db-tf-lock"
  }

}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-northeast-2a","ap-northeast-2c"]
}



variable "aws_region" {
  default = "ap-northeast-2"
}

variable "cluster-name" {
  default = "jyp-eks-cluster"
  type    = string
}
