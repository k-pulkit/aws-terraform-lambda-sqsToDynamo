
variable "aws_region" {
  description = "Region of aws project"
  type        = string
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

variable "lambda_name" {
  default = "Name of lambda function"
  type    = string
}

variable "queue_name" {
  description = "Name of the SQS queue to deploy"
  type        = string
}

variable "table_name" {
  description = "Name of dynamo table"
  type        = string
}

variable "lambda_source_dir" {
  description = "Dir where lambda code is present"
  type        = string
}

