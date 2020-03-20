/**
 * Web module, using terraform.
 */

variable "region_name" {
  description = "Name of the region where the resources will be deployed."
  default     = "us-east-2"
}

### Make sure to enter this value as an input!
### terraform apply -var "my_local_ip=xxx.xxx.xxx.xxx"

variable "my_local_ip" {
  description = "Local IP from where to ssh to the instance."
  type        = string
}

variable "ami_id" {
  description = "Id of AMI to deploy (Ohio)"
  type        = string
  default     = "ami-02ccb28830b645a41"
}

variable "instance_type" {
  description = "Type of instance to deploy in production."
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key name for the production environment (Note that they key name is not terraform_nerd here.)"
  default     = "terraform_nerd_ohio"
}