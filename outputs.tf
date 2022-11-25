output "flow_logs_id" {
  value       = aws_flow_log.flow_logs.id
  description = "The Flow Log ID."
}

output "flow_logs_role_arn" {
  value       = aws_iam_role.flow_logs.arn
  description = "The ARN specifying the role used by Flow Logs."
}

output "flow_logs_role_id" {
  value       = aws_iam_role.flow_logs.id
  description = "The ID specifying the role used by Flow Logs."
}

output "flow_logs_cloudwatch_group_arn" {
  value       = aws_cloudwatch_log_group.flow_logs.arn
  description = "The ARN specifying the log group used by Flow Logs."
}
