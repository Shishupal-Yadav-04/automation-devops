resource "aws_db_subnet_group" "rds" {
  name = "rds-subnet-group"
  subnet_ids = var.private_subnets_ids
  tags = var.tags
}
 resource "aws_db_instance" "this" {
    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    identifier = var.db_identifier
    username = var.db_username
    password = var.db_password
    db_subnet_group_name = aws_db_subnet_group.rds.name
    vpc_security_group_ids = var.db_sg_ids
    publicly_accessible = false
    skip_final_snapshot = true
    deletion_protection = false
    tags = var.tags
   
 }