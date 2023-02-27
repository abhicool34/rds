resource "aws_db_subnet_group" "db_subnet_group_secondary" {
  name       = "my-db-subnet-group"
  provider = aws.replica
  subnet_ids = ["subnet-07276c383f24ea8f5", "subnet-0de9aa7adb8a84bea","subnet-0a8b71559368c84d2"]
}

resource "aws_db_subnet_group" "db_subnet_group_primary" {
  name = "my-db-subnet-group"
  subnet_ids = [ "subnet-0ff16442d26628df4","subnet-0464a3f7248685cf8","subnet-0dfb753ab405a1c91" ]
}