# Fetch AWS Account ID
data "aws_caller_identity" "current" {}

locals {
  aws_account_id = var.aws_account_id != "" ? var.aws_account_id : data.aws_caller_identity.current.account_id
}

# Create IAM Users
resource "aws_iam_user" "users" {
  for_each = toset(var.group_users)
  name     = each.value
  path     = var.user_path
}

# Create IAM Group if enabled
resource "aws_iam_group" "this" {
  count = var.create_group ? 1 : 0
  name  = var.group_name
  path  = var.group_path
}

# Attach IAM Users to Group
resource "aws_iam_group_membership" "this" {
  count  = var.create_group ? 1 : 0
  name   = "${var.group_name}-membership"
  group  = aws_iam_group.this[0].name
  users  = var.group_users
}

# Attach AWS-Managed Policies
resource "aws_iam_group_policy_attachment" "custom_arns" {
  for_each   = { for idx, policy in var.custom_group_policy_arns : idx => policy }
  group      = aws_iam_group.this[0].name
  policy_arn = each.value
}

# Attach Custom Inline Policies
resource "aws_iam_group_policy" "custom_inline" {
  for_each = { for idx, policy in var.custom_group_policies : idx => policy }
  name     = each.value["name"]
  group    = aws_iam_group.this[0].name
  policy   = each.value["policy"]
}

# Attach IAM Self-Management Policy
resource "aws_iam_policy" "self_management" {
  count  = var.attach_iam_self_management_policy ? 1 : 0
  name   = "${var.iam_self_management_policy_name_prefix}${var.group_name}"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "iam:ChangePassword",
          "iam:CreateAccessKey",
          "iam:DeleteAccessKey",
          "iam:UpdateAccessKey",
          "iam:ListAccessKeys",
          "iam:GetAccountPasswordPolicy"
        ],
        Resource = "arn:aws:iam::${local.aws_account_id}:user/${aws_iam_group.this[0].name}/*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "self_management_attach" {
  count      = var.attach_iam_self_management_policy ? 1 : 0
  group      = aws_iam_group.this[0].name
  policy_arn = aws_iam_policy.self_management[0].arn
}

# Enforce MFA for Group Users (Optional)
resource "aws_iam_group_policy" "mfa_enforcement" {
  count = var.enable_mfa_enforcement ? 1 : 0
  name  = "${var.group_name}-mfa-enforcement"
  group = aws_iam_group.this[0].name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Deny",
        Action   = "*",
        Resource = "*",
        Condition = {
          BoolIfExists = {
            "aws:MultiFactorAuthPresent" = "false"
          }
        }
      }
    ]
  })
}
