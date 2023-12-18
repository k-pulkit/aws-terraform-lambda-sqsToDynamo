
output "DynamoARN" {
  value = aws_dynamodb_table.this.arn
}


output "BillMode" {
  value = aws_dynamodb_table.this.billing_mode
}


output "TableName" {
  value = aws_dynamodb_table.this.name
}