########01-custom-role-project-level###########
output "custom_role_id" {
  value = module.custom-roles.custom_role_id
}
#######02-assign-roles-to-svc-acc#######3333
output "project_id" {
  value = module.member_roles.project_id
}
output "roles_02_module" {
  value = module.member_roles.roles
}
#########03-service-accounts########
output "service_accounts" {
  value = module.service_account-iam-bindings.service_accounts
}
output "roles_03_module" {
  value = module.service_account-iam-bindings.roles
}
output "members" {
  value = module.service_account-iam-bindings.members
}
