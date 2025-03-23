resource "aws_db_parameter_group" "postgres" {
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  description = var.parameter_group_description
}

resource "aws_db_instance" "db" {
  allocated_storage                   = var.allocated_storage
  max_allocated_storage               = var.max_allocated_storage
  db_name                             = var.db_name
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  password                            = random_password.master.result
  username                            = var.db_username
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  parameter_group_name                = aws_db_parameter_group.postgres.name
  skip_final_snapshot                 = true
  identifier                          = var.db_identifier

  storage_encrypted   = var.storage_encrypted
  multi_az            = var.multi_az
  publicly_accessible = false

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  performance_insights_enabled = false

  auto_minor_version_upgrade = false
  copy_tags_to_snapshot      = false
  deletion_protection        = false

  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = aws_iam_role.rds_monitoring.arn

  tags = var.tags
}