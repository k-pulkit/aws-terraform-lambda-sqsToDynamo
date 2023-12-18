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
  source         = "./modules/lambda"
  lambda_name    = var.lambda_name
  source_dir     = var.lambda_source_dir
  sqs_queue_name = module.sqs.QueueName
  dynamodb_name  = module.dynamodb.TableName
  resource_tags  = var.resource_tags
}
