resource "aws_iam_policy" "this" {
  count       = var.create_policy ? 1 : 0
  name        = var.policy_name != null ? var.policy_name : null
  name_prefix = var.policy_name_prefix
  path        = var.policy_path
  description = var.policy_description
  policy      = file(var.custom_policy)

  tags = var.policy_tags
}
