/**
 * IAM Role. Returns the instance profile to apply to the EC2 instances.
 */

output "instance_profile_name" {
  value = aws_iam_instance_profile.this.name
}