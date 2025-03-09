resource "aws_iam_role" "rds_connect_role" {
  name               = "rds-connect-role"
  assume_role_policy = file("${path.module}/trust/rds-connect-role-policy.json")
}

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

resource "aws_iam_role_policy_attachment" "rds_connect" {
  role       = aws_iam_role.rds_connect_role.name
  policy_arn = aws_iam_policy.rds_connect.arn
}

resource "aws_iam_role_policy_attachment" "rds_monitoring" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

data "aws_caller_identity" "current" {}