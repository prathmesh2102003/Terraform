output "user_arn" {
  description = "The ARN of the IAM user"
  value       = try(aws_iam_user.this[0].arn, null)
}

output "access_key_id" {
  description = "The access key ID (if created)"
  value       = try(aws_iam_access_key.this[0].id, null)
  sensitive   = true
}

output "secret_access_key" {
  description = "The secret access key (if created)"
  value       = try(aws_iam_access_key.this[0].secret, null)
  sensitive   = true
}

output "user_login_profile" {
  description = "The IAM user login profile"
  value       = try(aws_iam_user_login_profile.this[0].password, null)
  sensitive   = true
}
