#here you ca add your custom variables
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = ""
}
###############iam-user##############
variable "create_user" {
  description = "Whether to create the IAM user"
  type        = bool
  default     = true
}

variable "user_name" {
  description = "Desired name for the IAM user"
  type        = string
}

variable "user_path" {
  description = "Desired path for the IAM user"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "Force destroy the IAM user even if it has non-Terraform-managed keys, login profile, or MFA devices"
  type        = bool
  default     = false
}

variable "permissions_boundary" {
  description = "The ARN of the policy used as the permissions boundary"
  type        = string
  default     = ""
}

variable "policy_arns" {
  description = "List of IAM policies to attach to the user"
  type        = list(string)
  default     = []
}

variable "create_iam_access_key" {
  description = "Whether to create an IAM access key"
  type        = bool
  default     = true
}

variable "iam_access_key_status" {
  description = "Access key status (Active/Inactive)"
  type        = string
  default     = null
}

variable "pgp_key" {
  description = "PGP key to encrypt password and access key"
  type        = string
  default     = ""
}

variable "create_iam_user_login_profile" {
  description = "Whether to create an IAM user login profile"
  type        = bool
  default     = true
}

variable "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 20
}

variable "password_reset_required" {
  description = "Force password reset on first login"
  type        = bool
  default     = true
}

variable "upload_iam_user_ssh_key" {
  description = "Whether to upload an SSH public key for the IAM user"
  type        = bool
  default     = false
}

variable "ssh_key_encoding" {
  description = "Specifies the public key encoding format (SSH or PEM)"
  type        = string
  default     = "SSH"
}

variable "ssh_public_key" {
  description = "SSH public key in ssh-rsa or PEM format"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
###############iam-groups###############
variable "attach_iam_self_management_policy" {
  description = "Whether to attach IAM policy which allows IAM users to manage their credentials and MFA"
  type        = bool
  default     = true
}

variable "aws_account_id" {
  description = "AWS account ID to use inside IAM policies. If empty, current AWS account ID will be used."
  type        = string
  default     = ""
}

variable "create_group" {
  description = "Whether to create IAM group"
  type        = bool
  default     = true
}

variable "custom_group_policies" {
  description = "List of maps of inline IAM policies to attach to IAM group. Should have name and policy keys in each element."
  type        = list(map(string))
  default     = []
}

variable "custom_group_policy_arns" {
  description = "List of IAM policies ARNs to attach to IAM group"
  type        = list(string)
  default     = []
}

variable "enable_mfa_enforcement" {
  description = "Determines whether permissions are added to the policy which requires the groups IAM users to use MFA"
  type        = bool
  default     = true
}

variable "group_users" {
  description = "List of IAM users to create and add to the IAM group"
  type        = list(string)
  default     = []
}

variable "iam_self_management_policy_name_prefix" {
  description = "Name prefix for IAM policy to create with IAM self-management permissions"
  type        = string
  default     = "IAMSelfManagement-"
}

variable "group_name" {
  description = "Name of IAM group"
  type        = string
}

variable "group_path" {
  description = "Desired path for the IAM group"
  type        = string
  default     = "/"
}

/*variable "user_path" {
  description = "Desired path for IAM users"
  type        = string
  default     = "/"
}*/
################iam-policy(custom)###############
variable "create_policy" {
  description = "Whether to create the IAM policy"
  type        = bool
  default     = true
}

variable "policy_description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "policy_name" {
  description = "The name of the policy"
  type        = string
  default     = null
}

variable "policy_name_prefix" {
  description = "IAM policy name prefix"
  type        = string
  default     = null
}

variable "policy_path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "custom_policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
}

variable "policy_tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

/*
1) environment variables
2) terraform.tfvars
3) variable blocks
*/