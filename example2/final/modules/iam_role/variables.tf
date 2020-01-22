/**
 * IAM Role variables.
 */

variable "s3_bucket_name" {
  description = "S3 bucket name to give access to."
  type        = string
}

variable "dynamodb_table_arn" {
  description = "Name of the DynamoDB table to give access to."
  type        = string
}