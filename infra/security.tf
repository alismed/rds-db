resource "random_password" "master" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "my_rds_credentials" {
  name = "rds-${lower(var.db_identifier)}-master-credentials"
  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "my_rds_credentials" {
  secret_id = aws_secretsmanager_secret.my_rds_credentials.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.master.result
  })
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow database inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = local.engine_config.port
    to_port     = local.engine_config.port
    protocol    = "tcp"
    cidr_blocks = var.sg_allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_allowed_cidr_blocks
  }

  tags = var.tags
}