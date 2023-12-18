provider "aws" {
  region = var.aws_region
}

resource "aws_sqs_queue" "deadletters" {
  name = "${var.queue_name}-deadletters"
  tags = var.resource_tags
}

resource "aws_sqs_queue" "this" {
  name                      = var.queue_name
  message_retention_seconds = 120
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.deadletters.arn
    maxReceiveCount     = 4
  })
  tags = var.resource_tags
}