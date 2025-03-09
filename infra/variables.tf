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
  description = "The identifier of the RDS instance"
  type        = string
  default     = ""
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

variable "master_password" {
  description = "Master password for RDS instance"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  default     = ""
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 1
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
  default     = 1
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "16.6"
}

variable "instance_class" {
  description = "Database instance class"
  type        = string
  default     = ""
}

variable "parameter_group_family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "postgres16"
}