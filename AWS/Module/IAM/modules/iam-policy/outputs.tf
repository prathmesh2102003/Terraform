output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(aws_iam_policy.this[0].arn, null)
}

output "description" {
  description = "The description of the policy"
  value       = var.policy_description
}

output "id" {
  description = "The policy's ID"
  value       = try(aws_iam_policy.this[0].id, null)
}

output "name" {
  description = "The name of the policy"
  value       = try(aws_iam_policy.this[0].name, null)
}

output "path" {
  description = "The path of the policy in IAM"
  value       = try(aws_iam_policy.this[0].path, null)
}

output "policy" {
  description = "The policy document"
  value       = var.custom_policy
}
