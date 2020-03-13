/**
 * Create an instance profile to apply to the EC2 Instance, for clarity
 * the module is named "iam_role" which is not strictly true. The effect
 * is equivalent.
 */

# Create the instance profile
resource "aws_iam_instance_profile" "this" {
  name = "test_profile"
  role = var.role_name
}
