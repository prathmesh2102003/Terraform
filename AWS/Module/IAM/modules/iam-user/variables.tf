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
