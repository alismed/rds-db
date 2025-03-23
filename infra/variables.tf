variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "Define the aws profile"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default = {
    Name        = ""
    Environment = ""
    Department  = ""
  }
}

variable "db_identifier" {
  type        = string
  description = "Database identifier"
  validation {
    condition     = can(regex("^[a-z0-9-]*$", var.db_identifier))
    error_message = "The db_identifier must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = ""
}

variable "iam_database_authentication_enabled" {
  description = "Enable IAM database authentication"
  type        = bool
  default     = true
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  default     = ""
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 10
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
  default     = 10
}

variable "engine_type" {
  description = "Type of database engine (postgres or mariadb)"
  type        = string
  validation {
    condition     = contains(["postgres", "mariadb"], var.engine_type)
    error_message = "Valid values for engine_type are: postgres, mariadb"
  }
}

variable "instance_class" {
  description = "Database instance class"
  type        = string
  default     = ""
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected"
  type        = number
  default     = 60
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 2
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in"
  type        = string
  default     = "Mon:04:00-Mon:05:00"
}

variable "sg_allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to connect to the database"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = true
}