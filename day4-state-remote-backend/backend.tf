terraform {
  backend "s3" {
    bucket = "anbhgfgdfs"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
