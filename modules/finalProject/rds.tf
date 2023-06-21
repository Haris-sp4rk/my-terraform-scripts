resource "aws_db_subnet_group" "example_db_subnet_group" {
  name       = "rds-group"
  subnet_ids = [aws_subnet.private_subnets[2].id,aws_subnet.private_subnets[0].id] # Replace with your subnet IDs

  tags = {
    Name = " RDS Subnet Group"
  }
}

resource "aws_db_instance" "rds_instance" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  identifier           = "rds-instance"
  username             = "admin"
  password             = "examplepassword"
  publicly_accessible  = false
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.example_db_subnet_group.name
  multi_az = false
  tags = {
    Name = "Final Project RDS Instance"
  }
}
