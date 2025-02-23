
 #creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile

provider "aws" { 
    region = "us-east-1"
}



resource "aws_s3_bucket" "test" {
  bucket = "nagamani123456"
  
}



resource "aws_instance" "dev" {
    ami = "ami-085ad6ae776d8f09c"
    instance_type = "t2.micro"
    depends_on = [ aws_s3_bucket.test]
}



 
