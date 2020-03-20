/**
 * Web module, using terraform.
 */

variable "region_name" {
  description = "Name of the region where the resources will be deployed."
}

variable "ami_id" {
  description = "Id for the machine image to use to create the ec2 instance"
  type        = string
}

variable "type_instance" {
  description = "Type of instance in AWS to create."
  type        = string
}

variable "key_name" {
  description = "Key pair to setup ssh"
  type        = string
}

variable "my_local_ip" {
  description = "Local IP from where to ssh to the instance."
  type        = string
}

variable "bucket_prefix" {
  description = "Prefix for the name of the S3 bucket"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table to create."
  type        = string
}

variable "instance_profile" {
  description = "Name of the instance profile (with the information for the role) to apply to the ec2 instances."
}

variable "name_prefix" {
  description = "Prefix for the name of the servers."
  type        = string
}