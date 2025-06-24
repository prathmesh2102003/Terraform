output "aws_account_id" {
  description = "IAM AWS account ID"
  value       = local.aws_account_id
}

output "group_arn" {
  description = "IAM group ARN"
  value       = try(aws_iam_group.this[0].arn, null)
}

output "group_name" {
  description = "IAM group name"
  value       = try(aws_iam_group.this[0].name, null)
}

output "group_users" {
  description = "List of IAM users in IAM group"
  value       = var.group_users
}

output "iam_user_arns" {
  description = "ARNs of the created IAM users"
  value       = { for user, obj in aws_iam_user.users : user => obj.arn }
}

output "attached_policy_arns" {
  description = "List of IAM policy ARNs attached to the group (both AWS-managed and custom)"
  value       = concat(
    var.custom_group_policy_arns,  # AWS-managed policies
    [for policy in aws_iam_group_policy.custom_inline : policy.name]  # Custom inline policies
  )
}
