## RDS Database
This project is to create a RDS Database in the AWS environment with Terraform and GitHub Actions.

### Requirements
- AWS Cli
- Terraform Cli
- Docker*
- Localstack Cli*
- S3 Bucket pre-built in AWS**

### Notes
- *Not essential, but recommended.
- **Is also possible to create a new bucket in this terraform script.

### Localstack
To use LocalStack on your local machine, add a profile in the aws cli settings:
- `.aws/credentials`
- `.aws/config`

### Terraform State
There is a S3 bucket pre-built used to store the terraform state file.
The bucket name is defined in the `backend.tf` file.

### Github Actions
The Github Actions is used to run the terraform script and deploy the Glue Job in the AWS environment.
The script only will run if the branch starts with `feature/`.

### Commands
```shell
localstack start -d
```

```shell
localstack stop
```

```shell
terraform -chdir="infra/s3-static-website/" init
```

```shell
terraform -chdir="infra/s3-static-website/" validate
```

```shell
terraform -chdir=infra fmt
```

```shell
terraform -chdir=infra plan
```

```shell
terraform -chdir=infra apply -auto-approve
```

```shell
terraform -chdir=infra destroy -auto-approve
```

### Get the RDS Master Credentials
```shell
aws secretsmanager get-secret-value \
  --secret-id "rds/dev-postgres/master-credentials" \
  --query 'SecretString' \
  --output text | jq -r .
```

### Generate RDS Token
```shell
export RDSHOST="dev-postgres.xxxxx.region.rds.amazonaws.com"
export TOKEN="$(aws rds generate-db-auth-token \
  --hostname $RDSHOST \
  --port 5432 \
  --region us-east-1 \
  --username foo)"
```

### Connect to RDS with Token
```shell
PGPASSWORD="${TOKEN}" psql \
  --host=$RDSHOST \
  --port=5432 \
  --username=foo \
  --dbname=mydb
```