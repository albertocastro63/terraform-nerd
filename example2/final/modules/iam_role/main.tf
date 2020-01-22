/**
 * Create an instance profile to apply to the EC2 Instance, for clarity
 * the module is named "iam_role" which is not strictly true. The effect
 * is equivalent.
 */

# Create the instance profile
resource "aws_iam_instance_profile" "this" {
  name = "test_profile"
  role = aws_iam_role.role.name
}

# Create the role that will be applied to ec2 instances (note the Service definition in the policy).
resource "aws_iam_role" "role" {
  name = "s3_db_access"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

# Attach policies to the role
resource "aws_iam_role_policy" "thepolicy" {
  name = "s3_dyndb_access"
  role = aws_iam_role.role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.s3_bucket_name}"
    },
    {
      "Action": [
        "dynamodb:*"
      ],
      "Effect": "Allow",
      "Resource": "${var.dynamodb_table_arn}"
    }
  ]
}
EOF
}
