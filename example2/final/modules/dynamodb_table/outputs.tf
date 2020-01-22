/**
 * DynamoDB table module outputs.
 */

output "table_name" {
  value = aws_dynamodb_table.this.name
}

output "table_hash_key" {
  value = aws_dynamodb_table.this.hash_key
}

output "table_arn" {
  value = aws_dynamodb_table.this.arn
}