/**
 Data sources for managed AWS policies.
*/

data "aws_iam_policy" "s3fullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy" "dynamoDBfullaccess" {
  arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}