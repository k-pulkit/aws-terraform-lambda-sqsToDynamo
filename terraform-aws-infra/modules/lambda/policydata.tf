
################ Define policy documents ################

data "aws_iam_policy_document" "assume_role_lambda" {
  statement {
    sid     = "AssumeRoleLambda"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "sqsdynamoaccess_lambda" {
  statement {
    sid       = "RestrictedSQSForLambda"
    effect    = "Allow"
    actions   = ["sqs:GetQueueAttributes", "sqs:ReceiveMessage", "sqs:DeleteMessage"]
    resources = [var.sqs_queue_arn]
  }

  statement {
    sid       = "CloudWatchLogsForLambda"
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = [ "*" ]
  }
}