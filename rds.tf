resource "aws_db_instance" "tf_rds" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0.20"
  instance_class    = "db.t2.micro"
  name              = "tf_rds"
  username          = "admin"
  password          = "X9Kr8REPKhbQa5Qw"
  availability_zone = var.availability_zone

  tags = {
    Name = "TF RDS Instance"
  }
}

resource "aws_security_group" "tf_rds_sg" {
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.tf_ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF RDS Security Group"
  }
}