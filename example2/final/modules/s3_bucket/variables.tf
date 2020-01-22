/**
 * S3 bucket variables.
 */

variable "bucket_name_prefix" {
  description = "Prefix for the bucket name, it will be padded with an 11 character string."
  type        = string
}

variable "bucket_region" {
  description = "The AWS region this bucket resides in."
  type        = string
}