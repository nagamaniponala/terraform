
module "s3_buket" {

  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.buket
  acl    = var.acl

  control_object_ownership = var.control
  object_ownership         = var.object_ownership

  versioning =var.versioning

}

