/**
 * S3 bucket output.
 * Outputs.
 */

output "bucket_name" {
  value = aws_s3_bucket.thebucket.id
}
