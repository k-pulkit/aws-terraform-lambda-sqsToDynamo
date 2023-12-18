
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "table_name" {
  description = "Name of dynamodb table"
  type        = string
}

variable "resource_tags" {
  description = "Tags used for this project for the resources I will create"
  type        = map(string)
}
