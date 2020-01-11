/**
 * Data sources.
 */

/*
   This command returns data from the default vpc group and creates a resource with it.
   For example its id, so we can use it to define the security group of the example.
   To see the complete list of exported data see https://www.terraform.io/docs/providers/aws/d/vpc.html.
 */
data "aws_vpc" "default_vpc" {
  default = true
}
