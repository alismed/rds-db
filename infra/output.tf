output "db_instance_endpoint" {
  value = aws_db_instance.db.endpoint
}

output "db_instance_id" {
  value = aws_db_instance.db.id
}

output "db_instance_username" {
  value = aws_db_instance.db.username
}

output "db_instance_port" {
  value = aws_db_instance.db.port
}

output "db_instance_address" {
  value = aws_db_instance.db.address
}

output "db_instance_resource_id" {
  value = aws_db_instance.db.resource_id
}

output "db_instance_engine" {
  value = aws_db_instance.db.engine
}

output "db_instance_allocated_storage" {
  value = aws_db_instance.db.allocated_storage
}

output "db_instance_class" {
  value = aws_db_instance.db.instance_class
}

output "db_instance_status" {
  value = aws_db_instance.db.status
}

output "aws_secretsmanager_secret" {
  value = aws_secretsmanager_secret.rds_credentials.arn
}

output "aws_secretsmanager_secret_version" {
  value = aws_secretsmanager_secret_version.rds_credentials.arn
}