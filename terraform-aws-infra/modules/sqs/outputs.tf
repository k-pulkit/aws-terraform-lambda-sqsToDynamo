output "QueueName" {
  value = aws_sqs_queue.this.name
}

output "Queueid" {
  value = aws_sqs_queue.this.id
}

output "QueueARN" {
  value = aws_sqs_queue.this.arn
}

output "QueueURL" {
  value = aws_sqs_queue.this.url
}