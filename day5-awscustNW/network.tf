
#create vpc
resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name= "prod-vpc"
  }
}

#create subnet
resource "aws_subnet" "prod" {
  vpc_id = aws_vpc.prod.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name= "prod-subnet"
  }
}
#create internet gateway
resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name= "prod-ig"
  }
}

#create route table and edit route

resource "aws_route_table" "prod" {
  vpc_id = aws_vpc.prod.id
  route{
    gateway_id = aws_internet_gateway.prod.id
    cidr_block = "0.0.0.0/0"
  }

}
#subnet assosiation
resource "aws_route_table_association" "prod" {
  route_table_id = aws_route_table.prod.id
  subnet_id= aws_subnet.prod.id
}

#create security group
 resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allow ssh inbound trafic"
    vpc_id = aws_vpc.prod.id   
 ingress {
  description = "allow from ssh"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}


 egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

 }
#create private subnet
resource "aws_subnet" "prod-private" {
  vpc_id = aws_vpc.prod.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name="private-subnet"
  }
}
#allocate elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  
}
#create private route and nategateway
resource "aws_nat_gateway" "Nat-gate" {
  subnet_id = aws_subnet.prod.id
  allocation_id = aws_eip.nat_eip.id
  tags = {
    Name="Nat-gateway"
  }

}
  # Create a Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.prod.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Nat-gate.id
  }

  tags = {
    Name = "Private Route Table"
  }
}


