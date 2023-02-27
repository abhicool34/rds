resource "aws_security_group" "aws_security_group_primary" {
  name_prefix = "my-db-sg"

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "aws_security_group_secondary" {
  name_prefix = "my-db-sg"
  provider = aws.replica
  
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

