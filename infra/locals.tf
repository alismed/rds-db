locals {
  db_engines = {
    postgres = {
      engine                      = "postgres"
      port                        = 5432
      parameter_group_family      = "postgres16"
      engine_version              = "16.6"
      parameter_group_name        = "custom-postgres16"
      parameter_group_description = "Custom parameter group for PostgreSQL 16"
    }
    mariadb = {
      engine                      = "mariadb"
      port                        = 3306
      parameter_group_family      = "mariadb11.4"
      engine_version              = "11.4.4"
      parameter_group_name        = "custom-mariadb114"
      parameter_group_description = "Custom parameter group for MariaDB 11.4"
    }
  }

  # Select the configuration based on the chosen engine
  engine_config = local.db_engines[var.engine_type]
}
