/**
 * Defines a Role to be applied to EC2 instances.
 */


provider "aws" {
  region  = "us-east-1"
  version = "~> 2.4"
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
resource "aws_iam_role_policy" "s3policy" {
  name = "s3_access"
  role = aws_iam_role.role.id

  policy = data.aws_iam_policy.s3fullaccess.policy
}

resource "aws_iam_role_policy" "dynamodbPolicy" {
  name = "dynamodb_access"
  role = aws_iam_role.role.id

  policy = data.aws_iam_policy.dynamoDBfullaccess.policy
}

# Create the instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "s3_dynamo_instance_profile"
  role = aws_iam_role.role.name
}