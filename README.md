# AWS RDS Database Module

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

Infrastructure as Code to create RDS databases in AWS using Terraform and GitHub Actions.

## Supported Features
- PostgreSQL
- MariaDB
- Automated Backup
- Multi-AZ
- Encryption
- Enhanced Monitoring
- Custom Parameter Groups

## Prerequisites

### Tools
- [AWS CLI](https://aws.amazon.com/cli/) configured
- [Terraform](https://www.terraform.io/downloads.html) (>= 1.0)
- [jq](https://stedolan.github.io/jq/download/)

### AWS
- S3 Bucket for Terraform state
- AWS Credentials with proper permissions
- Configured VPC

## Setup

### AWS Credentials
Configure your AWS credentials:
```bash
aws configure
```

## Deploy

### Terraform Commands
```bash
# Initialize
terraform -chdir=infra init

# Validate
terraform -chdir=infra validate

# Format
terraform -chdir=infra fmt

# Plan
terraform -chdir=infra plan

# Apply
terraform -chdir=infra apply -auto-approve

# Destroy
terraform -chdir=infra destroy -auto-approve
```

## Terraform State
State is stored remotely in a pre-configured S3 bucket (defined in `backend.tf`).

## CI/CD
GitHub Actions automates deployment when:
- Branch starts with `feature/`
- Pull Requests to `main`

## RDS Connection

### Getting Credentials
```bash
aws secretsmanager get-secret-value \
  --secret-id "rds-dev-database-master-credentials" \
  --query 'SecretString' \
  --output text | jq -r .
```

### Setting Host
```bash
export RDSHOST="dev-database.xxxxxxxxxxxx.region.rds.amazonaws.com"
```

### PostgreSQL (Port 5432)
```bash
psql \
  --host=$RDSHOST \
  --port=5432 \
  --username=dbuser \
  --dbname=mydb
```

### MariaDB (Port 3306)
```bash
mysql \
  -h $RDSHOST \
  -P 3306 \
  -u dbuser \
  mydb
```
