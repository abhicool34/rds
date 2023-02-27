resource "aws_db_instance" "primary" {
  availability_zone          =  "us-east-1f"
  allocated_storage          = 20
  engine                     = var.engine_type
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  db_name                    = "myprimarydb"
  username                   = "admin"
  password                   = "mypassword"
  backup_retention_period    = 1
  apply_immediately          = true
  publicly_accessible        = true
  parameter_group_name       = var.parameter_group_name
  db_subnet_group_name       = aws_db_subnet_group.db_subnet_group_primary.name
  vpc_security_group_ids     = [aws_security_group.aws_security_group_primary.id]
  skip_final_snapshot        = true
}



resource "aws_db_instance" "secondary_replica" {
  depends_on                     = [aws_db_subnet_group.db_subnet_group_primary]
  provider                       = aws.replica
  instance_class                 = var.instance_class
#   count                        = 1
#   db_name                      = "Replicadb"
#   username                     = "radmin"
#   password                     = "mypassword"
  parameter_group_name           = var.parameter_group_name
#   replica_mode                   = var.replica_mode
  vpc_security_group_ids         =  [aws_security_group.aws_security_group_secondary.id]
  db_subnet_group_name           = aws_db_subnet_group.db_subnet_group_secondary.name
  replicate_source_db            = aws_db_instance.primary.arn
  backup_retention_period        = 1
  skip_final_snapshot            = true

}



