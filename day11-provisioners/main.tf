provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "type" {
  key_name   = "task"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub") 
}

resource "aws_instance" "server" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.type.id
  

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:/Users/veerababu/.ssh/id_rsa")
    private_key = file("~/.ssh/id_rsa")  #private key path
    host        = self.public_ip
  }
  # local execution procee 
 provisioner "local-exec" {
    command = "touch test"
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "naga"  # Replace with the path to your local file
    destination = "/home/ubuntu/naga"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch dev",
"echo hello from aws >> dev",
]
 }
}

 