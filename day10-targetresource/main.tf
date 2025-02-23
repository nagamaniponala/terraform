resource "aws_instance" "dependent" {
    ami = "ami-085ad6ae776d8f09c"
    instance_type = "t2.micro"
    key_name = "keyy"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "nagamani12345" 
}