variable "ami" {
    type = string
    default = "ami-085ad6ae776d8f09c"
}

variable "type" {
    type = string
    default = "t2.micro"
}

variable "buket" {
    type=string
    default = ""

}
variable "acl" {
    type=string
    default = ""

}
variable "control" {
    type=string
    default = ""

}

variable "object_ownership" {
    type=string
    default = ""

}


variable "versioning" {
  type = object({
    enabled = bool
  })
  default = {
    enabled = true
  }
}
