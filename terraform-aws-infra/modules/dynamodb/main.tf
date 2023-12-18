provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  hash_key     = "messageid"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "messageid"
    type = "S"
  }

  tags = var.resource_tags
}