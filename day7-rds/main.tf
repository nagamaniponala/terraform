resource "aws_db_instance" "primary" {
  identifier              = "primary1"
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = "mydb"
  username                = "admin"
  password                = "multicloud12345"
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = "true"
  multi_az                = "true"

}

resource "aws_db_subnet_group" "sub-grp" {
 name= "mycustsubnet" 
 subnet_ids = ["subnet-0168199b67c1e61be,subnet-0d0de8df22fb18096"]
 tags = {
   Name= "My Db subnet group"
 }
}
 resource "aws_db_instance" "read" {
  identifier           = "read-replica"
  instance_class      = "db.t3.micro"
  replicate_source_db = aws_db_instance.primary.id
  publicly_accessible = false
  skip_final_snapshot = true
 }