# terraform-aws-backend-module

A Terraform module to provision an AWS S3 bucket and DynamoDB table for remote state management and state locking.

## Usage

```hcl
module "backend" {
  source         = "<registry-username>/backend/aws" # Replace with the actual registry source
  region         = "eu-west-1"
  bucket_name    = "terraform-bucket-name"
  dynamodb_table = "terraform-locks"
  tags = {
    Environment = "dev"
    Project     = "example"
  }
}
```

## Backend Configuration Example

Configure your backend in `backend.tf`:

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

| Name           | Description                                 | Type   | Default | Required |
|----------------|---------------------------------------------|--------|---------|----------|
| region         | AWS region for resources                    | string | n/a     | yes      |
| bucket_name    | Name of the S3 bucket for state             | string | n/a     | yes      |
| dynamodb_table | Name of the DynamoDB table for state locks  | string | n/a     | yes      |
| tags           | Tags to apply to resources                  | map    | {}      | no       |

## Outputs

| Name               | Description                      |
|--------------------|----------------------------------|
| bucket_arn         | ARN of the created S3 bucket      |
| dynamodb_table_arn | ARN of the DynamoDB table         |

## Requirements

- Terraform >= 1.0.0
- AWS provider >= 4.0.0
- AWS CLI configured with appropriate permissions

## License

Apache 2.0 License. See LICENSE file for details.
