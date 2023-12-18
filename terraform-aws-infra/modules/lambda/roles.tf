

################ Define policy resource ################

resource "aws_iam_policy" "this" {
  name   = "${var.lambda_name}-lambda-role-policy"
  policy = data.aws_iam_policy_document.sqsdynamoaccess_lambda.json
  tags   = var.resource_tags
}


################ Define role resource, and attach policies ################

resource "aws_iam_role" "this" {
  name               = "${var.lambda_name}-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
  tags               = var.resource_tags
}

resource "aws_iam_policy_attachment" "AttachPoliciesToLambdaRole" {
  name       = "${var.lambda_name}-lambda-role-policy-attachment"
  policy_arn = aws_iam_policy.this.arn
  roles      = [aws_iam_role.this.name]
}