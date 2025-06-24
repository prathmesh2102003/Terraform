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

variable "user_path" {
  description = "Desired path for IAM users"
  type        = string
  default     = "/"
}
