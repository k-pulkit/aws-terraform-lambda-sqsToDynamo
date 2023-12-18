
provider "aws" {
  region = var.aws_region
}

data "archive_file" "lambda_function" {
  source_dir  = var.source_dir
  output_path = "${path.module}/lambda.zip"
  type        = "zip"
}

resource "aws_lambda_function" "this" {
  filename         = "${path.module}/lambda.zip"
  source_code_hash = data.archive_file.lambda_function.output_base64sha256
  function_name    = var.lambda_name
  role             = aws_iam_role.this.arn
  handler          = "index.handler"
  runtime          = "python3.8"
  tags = var.resource_tags
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${aws_lambda_function.this.function_name}"
  retention_in_days = 1
  tags = var.resource_tags
}