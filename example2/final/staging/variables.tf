/**
 * Web module, using terraform.
 */

variable "region_name" {
  description = "Name of the region where the resources will be deployed."
  default     = "us-east-1"
}

variable "ami_id" {
  description = "Id for the machine image to use to create the ec2 instance"
  type        = string
  default     = "ami-00068cd7555f543d5"
}

variable "instance_type" {
  description = "Type of instance in AWS to create."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair to setup ssh"
  type        = string
  default     = "terraform_nerd"
}

variable "bucket_prefix" {
  description = "Prefix for the name of the S3 bucket"
  type        = string
  default     = "terraform-nerd-bucket-staging"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table to create."
  type        = string
  default     = "terraform-nerd-table-staging"
}

### Make sure to enter this value as an input!

variable "my_local_ip" {
  description = "Local IP from where to ssh to the instance."
  type        = string
}
