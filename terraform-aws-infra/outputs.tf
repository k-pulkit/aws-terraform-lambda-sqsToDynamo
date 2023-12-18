
output "SQSQueueName" {
  value = module.sqs.QueueName
}

output "SQSQueueARN" {
  value = module.sqs.QueueARN
}

output "LambdaARN" {
  value = module.lambda.LambdaARN
}

output "LambdaLogs" {
  value = module.lambda.LambdaLogs
}