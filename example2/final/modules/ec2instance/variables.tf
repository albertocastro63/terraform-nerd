/**
 * EC2 instance variables.
 */

variable "ami_id" {
  description = "Id for the machine image to use to create the ec2 instance"
  type        = string
}

variable "type" {
  description = "Type of instance in AWS to create."
  type        = string
}

variable "key_name" {
  description = "Key"
  type        = string
  default     = "terraform_nerd"
}

variable "security_group_ids" {
  description = "List of ids for security groups to assign to the EC2 instance"
  type        = list(string)
}

variable "instance_profile" {
  description = "Name of the IAM instance profile to apply to the EC2 instance."
  type        = string
}

variable "name" {
  description = "Name to tag the instance with."
  type        = string
}