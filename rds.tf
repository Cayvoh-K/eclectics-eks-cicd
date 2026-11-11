resource "aws_db_subnet_group" "main" {
  name = "eclectics-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "eclectics-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier        = "eclectics-postgres"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "appdb"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false
  storage_encrypted   = true
  multi_az            = false
  skip_final_snapshot = true
  apply_immediately   = true

  tags = {
    Name = "eclectics-postgres"
  }
}