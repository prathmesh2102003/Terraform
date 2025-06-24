target_level         = "project"
target_id            = "prathmesh-iam"
role_id              = "custom_role_practice"
title                = "Custom role for practice"
description          = "Custom Role Description is the role is used for only the testing purpose"
#base_roles           = ["roles/viewer", "roles/storage.objectViewer"]
permissions          = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
excluded_permissions = ["iam.roles.delete"]
stage                = "GA"
members = [
    "serviceAccount:service-webaccount@prathmesh-iam.iam.gserviceaccount.com", 
    "user:chavanchinmay2424@gmail.com"
]
#########02-assign-roles-to-svc-acc###########
service_account_address = "sample-svc@prathmesh-iam.iam.gserviceaccount.com"
prefix                  = "serviceAccount"
project_id              = "prathmesh-iam"
project_roles           = [ 
   "roles/compute.networkAdmin" , 
   "roles/compute.admin" ]
########03-service-accounts############
##########module###########
project = "prathmesh-iam"

service_accounts = [
  "service-account-1@your-project.iam.gserviceaccount.com",
  "service-account-2@your-project.iam.gserviceaccount.com"
]

mode = "additive"

bindings = {
/*  "roles/iam.serviceAccountKeyAdmin" = [
    "serviceAccount:${google_service_account.service_account_one.email}"
  ]
*/
  "roles/iam.serviceAccountTokenCreator" = [
    "user:chavanchinmay2424@gmail.com",
  ]
}

conditional_bindings = [
  {
    role        = "roles/iam.serviceAccountUser"
    title       = "expires_after_2019_12_31"
    description = "Expiring at midnight of 2025-12-31"
    expression  = "request.time < timestamp(\"2026-01-01T00:00:00Z\")"
    members     = ["user:prathmeshamale646@gmail.com"]
  }
]
#########resource-google_service_account###########
account_id   = "my-service-for-test"
display_name = "my_svc_test_acc"

