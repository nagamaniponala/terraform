resource "aws_instance" "import" {
  ami="ami-053a45fff0a704a47"
  instance_type = "t2.micro"
  key_name = "keyy"
  tags = {
    Name="dev"
  }
}