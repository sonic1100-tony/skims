resource "aws_s3_bucket" "skims-s3-tf-state" {

  bucket = "skims-s3-tf-state"

  tags = {
    "Name" = "skims-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "skims-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.skims-s3-tf-state]
  name         = "skims-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "skims-ddb-tf-lock"
  }

}