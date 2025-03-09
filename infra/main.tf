resource "aws_iam_role" "rds_monitoring" {
  name               = "rds-monitoring-role"
  assume_role_policy = file("${path.module}/trust/monitoring-role.json")
}

resource "aws_iam_policy" "rds_connect" {
  name = "rds-db-connect"
  policy = templatefile("${path.module}/trust/rds-policy.json", {
    region      = var.region
    account_id  = data.aws_caller_identity.current.account_id
    resource_id = aws_db_instance.db.resource_id
    username    = var.db_username
  })
}

data "aws_caller_identity" "current" {}
resource "aws_iam_role_policy_attachment" "rds_monitoring" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_db_parameter_group" "postgres" {
  family = var.parameter_group_family
  name   = "custom-postgres16"

  description = "Custom parameter group for PostgreSQL 16"
}

resource "aws_db_instance" "db" {
  allocated_storage                   = var.allocated_storage
  max_allocated_storage               = var.max_allocated_storage
  db_name                             = var.db_name
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  password                            = var.master_password
  username                            = var.db_username
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  parameter_group_name                = aws_db_parameter_group.postgres.name
  skip_final_snapshot                 = true
  identifier                          = var.db_identifier

  # Security enhancements
  storage_encrypted   = true
  multi_az            = true
  publicly_accessible = false

  # Backup configuration
  backup_retention_period = 2
  backup_window           = "03:00-04:00"
  maintenance_window      = "Mon:04:00-Mon:05:00"

  # Network security
  #vpc_security_group_ids = []

  # Performance insights
  performance_insights_enabled = false
  #performance_insights_retention_period = 7

  # Security settings
  auto_minor_version_upgrade = false
  copy_tags_to_snapshot      = false
  deletion_protection        = true

  # Monitoring
  monitoring_interval = 60
  monitoring_role_arn = aws_iam_role.rds_monitoring.arn

  tags = var.tags
}

