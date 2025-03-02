module "ec2" {
  source         = "../modules/ec2"
  ami_id= var.ami
  instance_type=var.type
  
  
}