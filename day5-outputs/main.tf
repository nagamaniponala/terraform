resource "aws_instance" "dev" {
  ami = "ami-085ad6ae776d8f09c"
  instance_type = "t2.micro"
  key_name = "keyy"
  availability_zone = "us-east-1b"
  tags = {
    Name="dev"
  }
}