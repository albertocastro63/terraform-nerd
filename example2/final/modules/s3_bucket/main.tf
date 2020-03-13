/**
 * S3 bucket. Name padded with a random string for uniqueness.
 */

provider "random" {
  version = "~> 2.2"
}

resource "random_string" "random" {
  length  = 10
  special = false
  lower   = true
  upper   = false
}

locals {
  bucket_name = join("-", [var.bucket_name_prefix != "" ? var.bucket_name_prefix : "terraform-nerd-s3-bucket", random_string.random.result])
}

resource "aws_s3_bucket" "thebucket" {
  bucket = local.bucket_name
  acl    = "private"
}
