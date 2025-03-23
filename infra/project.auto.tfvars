profile                             = "default"
region                              = "us-east-1"
vpc_id                              = "vpc-596a1d3c"
engine_type                         = "mariadb" # #Choose which engine to use 'mariadb' or ´postgres´
db_name                             = "mydb"
db_identifier                       = "dev-database"
db_username                         = "dbuser"
iam_database_authentication_enabled = true
allocated_storage                   = 20
max_allocated_storage               = 30
instance_class                      = "db.t3.micro"
destroy_infra                       = false
tags = {
  Name        = "mydb"
  Environment = "dev"
  Department  = "engineering"
}


# PostgreSQL
#engine                              = "postgres"
#parameter_group_family              = "postgres16"
#engine_version                      = "16.6"
#instance_class                      = "db.t3.micro"
#db_port                             = 5432
#parameter_group_name                = "custom-postgres16"
#parameter_group_description         = "Custom parameter group for PostgreSQL 16"


# MariaDB
#engine                      = "mariadb"
#parameter_group_family      = "mariadb11.4"
#engine_version              = "11.4.4"
#parameter_group_name        = "custom-mariadb114"
#parameter_group_description = "Custom parameter group for MariaDB 11.4"
