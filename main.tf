resource "aws_cloudwatch_log_group" "vpc" {
  name = "${var.name_prefix}-vpc-flow-logs"

  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id

  tags = var.tags
}

resource "aws_iam_role" "vpc" {
  name = "${var.name_prefix}-vpc-flow-logs"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "vpc-flow-logs.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )

  inline_policy {
    name   = "cloudwatch-policy"
    policy = data.aws_iam_policy_document.cloudwatch.json
  }

  tags = var.tags
}

resource "aws_flow_log" "vpc" {
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.vpc.arn

  iam_role_arn = aws_iam_role.vpc.arn
  vpc_id       = var.vpc_id
  traffic_type = var.traffic_type

  max_aggregation_interval = var.max_aggregation_interval

  tags = var.tags
}
