 
#create instance
resource "aws_instance" "dev" {
  ami = "ami-085ad6ae776d8f09c"
  instance_type = "t2.micro"
  key_name = "keyy"
  subnet_id = aws_subnet.prod.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name="dev"
}
}