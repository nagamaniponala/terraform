module "ec2" {
  source         = "../modules/ec2"
  ami_id= var.ami
  instance_type=var.type
  
  
}

module "s3_buket" {

  source = "../modules/s3"

  bucket = var.buket
  acl    = var.acl

  control_object_ownership = var.control
  object_ownership         = var.object_ownership

  versioning =var.versioning

}
