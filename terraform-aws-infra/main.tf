provider "aws" {
  profile = "terraform"
  region  = var.aws_region
}

module "sqs" {
  source        = "./modules/sqs"
  queue_name    = var.queue_name
  resource_tags = var.resource_tags
}

module "lambda" {
  source        = "./modules/lambda"
  source_dir    = var.lambda_source_dir
  sqs_queue_arn = module.sqs.QueueARN
  resource_tags = var.resource_tags
}


