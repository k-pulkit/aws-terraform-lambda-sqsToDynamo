variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "lambda_name" {
  description = "Name of the SQS queue to deploy"
  type        = string
  default     = "TestLambda"
}

variable "sqs_queue_arn" {
  description = "ARN of the SQS queue which is event source"
  type        = string
}

variable "source_dir" {
  description = "Source dir of the lambda code"
  type        = string
}

variable "resource_tags" {
  description = "Tags used for this project for the resources I will create"
  type        = map(string)
}


