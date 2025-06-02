variable "region" {
  description = "AWS region for backend resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to store Terraform state"
    validation {
        condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
        error_message = "Bucket name must be between 3 and 63 characters long, and can only contain lowercase letters, numbers, periods, and hyphens."
    }
  type        = string
  default = "values-terraform-state-bucket"

}

variable "dynamodb_table" {
  description = "Name of the DynamoDB table for Terraform locking"
  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{3,255}$", var.dynamodb_table))
    error_message = "DynamoDB table name must be between 3 and 255 characters long, and can only contain letters, numbers, underscores, periods, and hyphens."
  }
  type        = string
  default = "lock-table-terraform-state"
}
variable "tags" {
  description = "Tags to apply to the S3 bucket and DynamoDB table"
  type        = map(string)
  default = {
    Name = "Terraform State and Lock Resources"
  }
}