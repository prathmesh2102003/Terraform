resource "aws_iam_user" "this" {
  count = var.create_user ? 1 : 0

  name                 = var.user_name
  path                 = var.user_path
  force_destroy        = var.force_destroy
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags
}

resource "aws_iam_user_policy_attachment" "this" {
  count = var.create_user ? length(var.policy_arns) : 0

  user       = aws_iam_user.this[0].name
  policy_arn = var.policy_arns[count.index]
}

resource "aws_iam_access_key" "this" {
  count = var.create_user && var.create_iam_access_key ? 1 : 0

  user    = aws_iam_user.this[0].name
  status  = var.iam_access_key_status
  pgp_key = var.pgp_key
}

resource "aws_iam_user_login_profile" "this" {
  count = var.create_user && var.create_iam_user_login_profile ? 1 : 0

  user                    = aws_iam_user.this[0].name
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
  pgp_key                 = var.pgp_key
}

resource "aws_iam_user_ssh_key" "this" {
  count = var.create_user && var.upload_iam_user_ssh_key ? 1 : 0

  encoding = var.ssh_key_encoding
  public_key = var.ssh_public_key
  username  = aws_iam_user.this[0].name
}
