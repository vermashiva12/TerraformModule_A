resource "aws_db_instance" "testDB" {
    allocated_storage = 20
    identifier = var.dbidentifier
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.27"
    instance_class = "db.t2.micro"
    vpc_security_group_ids = [var.dbGroup.id]
    db_name = var.dbname
    username = var.username
    password = var.userPass
    publicly_accessible = true
    skip_final_snapshot = true

    tags = {
        Name = "Test Database Instance"
    }
  
}