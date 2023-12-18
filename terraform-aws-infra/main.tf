provider "aws" {
  profile = "terraform"
  region  = var.aws_region
}

module "sqs" {
  source        = "./modules/sqs"
  queue_name    = var.queue_name
  resource_tags = var.resource_tags
}

module "dynamodb" {
  source        = "./modules/dynamodb"
  table_name    = var.table_name
  resource_tags = var.resource_tags
}

module "lambda" {
  source        = "./modules/lambda"
  source_dir    = var.lambda_source_dir
  sqs_queue_arn = module.sqs.QueueARN
  dynamodb_arn  = module.dynamodb.DynamoARN
  resource_tags = var.resource_tags
}
