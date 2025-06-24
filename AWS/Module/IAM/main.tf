# Terraform AWS IAM User Module
module "iam_user" {
  source = "./modules/iam-user"

  user_name                     = var.user_name
  create_iam_access_key         = var.create_iam_access_key
  iam_access_key_status         = var.iam_access_key_status
  create_iam_user_login_profile = var.create_iam_user_login_profile
  password_length               = var.password_length
  password_reset_required       = var.password_reset_required
  policy_arns                   = var.policy_arns
  tags = var.tags
}
# Terraform AWS IAM Groups Module
module "iam_group" {
  source                            = "./modules/iam-groups"
  group_name                        = var.group_name
  group_users                       = var.group_users
  attach_iam_self_management_policy = var.attach_iam_self_management_policy
  enable_mfa_enforcement            = var.enable_mfa_enforcement
  custom_group_policy_arns          = var.custom_group_policy_arns
}
# Terraform AWS IAM Policy Module
module "iam_policy" {
  source = "./modules/iam-policy"

  create_policy      = var.create_policy
  policy_name        = var.policy_name
  policy_description = var.policy_description
  custom_policy      = var.custom_policy
  policy_tags        = var.policy_tags
}