/**
 * EC2 instance in AWS creted in terraform (v3).
 * Variables (inputs)
 */


variable "ami_id" {
  description = "Id for the machine image to use to create the ec2 instance"
  type        = string
  default     = "ami-00068cd7555f543d5"
}

### NOTICE THAT THE DEFAULT VALUE IS MISSING HERE! ###
variable "type" {
  description = "Type of instance in AWS to create."
  type        = string
}

variable "key_name" {
  default = "terraform_nerd"
}
