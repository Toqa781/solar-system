resource "aws_s3_bucket" "statefile-s3-bucket" {
  bucket = "solar-system-eks-tfstate-bucket-12345"
}

resource "aws_dynamodb_table" "lock-dynamodb" {
  name             = "terraform-eks-state-locks"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }
}