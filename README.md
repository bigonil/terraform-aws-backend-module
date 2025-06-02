# terraform-aws-backend-module

This Terraform module creates an AWS backend for managing remote state and locks using S3 and DynamoDB.

## Usage

Add this module to your Terraform configuration file:

```hcl
module "backend" {
  source         = "github.com/<your-username>/terraform-aws-backend-module"
  region         = "eu-west-1"                # AWS region
  bucket_name    = "terraform-bucket-name"    # S3 bucket name
  dynamodb_table = "terraform-locks"          # DynamoDB table name
}
```

### Example backend configuration

In your `backend.tf`:

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-bucket-name"
    key            = "path/to/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

## Variables

- `region`: AWS region where resources will be created
- `bucket_name`: Name of the S3 bucket for state
- `dynamodb_table`: Name of the DynamoDB table for locks

## Outputs

- `bucket_arn`: ARN of the created S3 bucket
- `dynamodb_table_arn`: ARN of the created DynamoDB table

## Prerequisites

- AWS CLI configured
- Permissions to create S3 buckets and DynamoDB tables

## License

This module is licensed under the Apache 2.0 License.
