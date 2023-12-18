
variable "aws_region" {
  description = "Region of aws project"
  type        = string
  default     = "aws-east-1"
}

variable "resource_tags" {
  description = "Tags used for this project for the resources I will create"
  type        = map(string)
  default = {
    projectid   = "Lab1",
    project     = "SQS to Dynamo via Lambda",
    environment = "development"
  }
}

variable "queue_name" {
  description = "Name of the SQS queue to deploy"
  type        = string
}

variable "lambda_source_dir" {
  description = "Dir where lambda code is present"
  type        = string
}

