resource "aws_db_instance" "defidb" {
  
  allocated_storage       = 10
  identifier              = "defiml"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  db_subnet_group_name    = "defiml-db-group" # Copy the subnet group from the RDS Console
  db_name                 = "defiml"
  username                = "defiml"
  password                = "Hagnar469425"
  parameter_group_name    = "default.mysql5.7"
  publicly_accessible     = false
  skip_final_snapshot     = true
}

resource "aws_db_subnet_group" "defiml-db-group" {
  name       = "defiml-db-group"
  subnet_ids = [aws_subnet.private-us-east-1a.id, aws_subnet.private-us-east-1b.id]

  tags = {
    Name = "My DB defiml-db-group"
  }
}
 
output "Endpoint_string" {
  value = aws_db_instance.defidb.endpoint
}