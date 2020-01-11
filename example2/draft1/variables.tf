/**
 * Web module, using terraform.
 */

variable "ami_id" {
  description = "Id for the machine image to use to create the ec2 instance"
  type        = string
  default     = "ami-00068cd7555f543d5"
}

variable "type" {
  description = "Type of instance in AWS to create."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair to setup ssh"
  default     = "terraform_nerd"
}
