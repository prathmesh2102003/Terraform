module "custom-roles" {
  source = "terraform-google-modules/iam/google//modules/custom_role_iam"

  target_level = var.target_level
  target_id    = var.target_id
  role_id      = var.role_id
  title        = var.title
  description  = var.description
  permissions  = var.permissions
  members      = var.members
}
######-02-assign-role-to-svc-acc##########
module "member_roles" {
  source   = "terraform-google-modules/iam/google//modules/member_iam"
  version  = "~> 8.0"
  service_account_address = var.service_account_address
  prefix                  = var.prefix
  project_id              = var.project_id
  project_roles           = var.project_roles
}
#########03-service-accounts###########
resource "google_service_account" "service_account_one" {
  account_id   = var.account_id
  display_name = var.display_name
  project      = var.project
}
module "service_account-iam-bindings" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "~> 8.0"

  service_accounts     = [google_service_account.service_account_one.email]
  project              = var.project
  mode                 = var.mode
  bindings             = var.bindings
  conditional_bindings = var.conditional_bindings
}
