
################ Define sqs as lambda trigger ################

resource "aws_lambda_event_source_mapping" "SQSEventSourceForLambda" {
  event_source_arn                   = var.sqs_queue_arn
  enabled                            = true
  function_name                      = aws_lambda_function.this.arn
  batch_size                         = 10
  maximum_batching_window_in_seconds = 200
}