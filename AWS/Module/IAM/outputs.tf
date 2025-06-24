#########IAM user############
output "user_arn" {
  value = module.iam_user.user_arn
}
output "user_login_profile" {
  value = module.iam_user.user_login_profile
  sensitive = true
}
output "access_key_id" {
  value = module.iam_user.access_key_id
  sensitive = true
}
output "secret_access_key" {
  value = module.iam_user.secret_access_key
  sensitive = true
}
#########IAM groups############
output "group_name" {
  value = module.iam_group.group_name
}
output "group_arn" {
  value = module.iam_group.group_arn
}
output "group_users" {
  value = module.iam_group.group_users
}
output "aws_account_id" {
  value = module.iam_group.aws_account_id
}
#########IAM Policy(custom)############
output "policy_arn" {
  value = module.iam_policy.arn
}
output "policy_description" {
  value = module.iam_policy.description
}
output "policy_name" {
  value = module.iam_policy.name
}
output "policy" {
  value = module.iam_policy.policy
}
