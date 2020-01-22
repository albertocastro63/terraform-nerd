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
