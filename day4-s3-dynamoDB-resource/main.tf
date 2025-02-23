
#creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile

provider "aws" { 
}

resource "aws_s3_bucket" "example" {
  bucket = "anbhgfgdfs"
  
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket =aws_s3_bucket.example.id
  versioning_configuration {
    status = "enabling"
  }

}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}
