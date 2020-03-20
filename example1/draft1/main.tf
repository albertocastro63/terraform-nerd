/**
 * EC2 instance in AWS creted in terraform.
 */

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.39"
}

resource "aws_instance" "myapp" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"
  key_name      = "terraform_nerd"

  tags = {
    Name = "Example 1 / Draft 1"
  }
}
