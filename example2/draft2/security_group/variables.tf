/**
 * security_group module inputs
 */

variable "vpc_id" {
  description = "Id of the VPC where the infrastructure should be deployed."
  type        = string
}

variable "ingress_with_cidr_blocks" {
  description = "Description of the ingress rules to create in the security group."
  type        = list(object({ from_port=number, to_port=number, protocol=string, cidr_blocks=list(string)}))
  default     = []
}

variable "egress_with_cidr_blocks" {
  description = "Description of the egress rules to create in the security group."
  type        = list(object({ from_port=number, to_port=number, protocol=string, cidr_blocks=list(string)}))
  default     = []
}