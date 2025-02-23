data "aws_subnet" "main" {
  filter {
    name   = "tag:Name"
    values = ["sub1"] # insert value here
  }
}

data "aws_security_groups" "main" {
  filter {
    name   = "tag:Name"
    values = ["test"] # insert value here
  }
}



resource "aws_instance" "dev" {
   ami = "ami-085ad6ae776d8f09c"
   instance_type ="t2.micro"
   key_name = "keyy"
   subnet_id = data.aws_subnet.main.id
   security_groups = data.aws_security_groups.main.ids
}