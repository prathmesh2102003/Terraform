aws_region = "us-east-1"
############iam-user##############
create_user          = true
user_name            = "s3-user-1"
user_path            = "/"
force_destroy        = false
permissions_boundary = ""
policy_arns = [
  "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
]
create_iam_access_key         = true
iam_access_key_status         = "Active"
pgp_key                       = ""
create_iam_user_login_profile = true
password_length               = 8
password_reset_required       = true
upload_iam_user_ssh_key       = false
ssh_key_encoding              = "SSH"
ssh_public_key                = ""
tags = {
  Environment = "Development"
  Project     = "MyProject"
}
##########iam-groups###############
attach_iam_self_management_policy = true
aws_account_id                    = "" # Replace with AWS account ID or leave empty
create_group                      = true
custom_group_policies = [
  {
    name   = "CustomPolicy1"
    policy = "{}" # Replace with JSON policy
  },
  {
    name   = "CustomPolicy2"
    policy = "{}" # Replace with JSON policy
  }
]
custom_group_policy_arns = [
  "arn:aws:iam::aws:policy/AdministratorAccess",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess"
] # Replace with actual policy ARNs if needed
enable_mfa_enforcement                 = true
group_users                            = ["user1", "user2", "user3"]
iam_self_management_policy_name_prefix = "IAMSelfManagement-"
group_name                             = "S3Users" 
group_path                             = "/"
#user_path                         = "/"
##############iam-policy(custom)##############
create_policy      = true
policy_description = "Readonly access of EC2 and S3"
policy_name        = "tf-custom-policy"
policy_name_prefix = "custom-policy-"
policy_path        = "/"
custom_policy      = "./readonly.json"
policy_tags = {
  Environment = "dev"
  Owner       = "admin"
}
