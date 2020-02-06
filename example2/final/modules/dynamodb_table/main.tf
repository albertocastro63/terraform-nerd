/**
 * Defines a DynamoDB table in the region specified by the aws provider statement.
 */

resource "aws_dynamodb_table" "this" {
  name           = var.table_name
  hash_key       = "ObjectId"
  write_capacity = 5
  read_capacity  = 5

  attribute {
    name = "ObjectId"
    type = "S"
  }
}
