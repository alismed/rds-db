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
destroy_infra                       = true
tags = {
  Name        = "mydb"
  Environment = "dev"
  Department  = "engineering"
}
