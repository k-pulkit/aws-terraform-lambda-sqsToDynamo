
output "LambdaIamRoleArn" {
  description = "iam role for lambda"
  value       = aws_iam_role.this.arn
}

output "LambdaLogs" {
  value = aws_cloudwatch_log_group.lambda_logs.name
}

output "LambdaARN" {
  value = aws_lambda_function.this.arn
}

output "LambdaName" {
  value = aws_lambda_function.this.function_name
}