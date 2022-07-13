#-----------------------------------------------------------
# IAM user policy attachment
#-----------------------------------------------------------
resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  count = var.enable_iam_user_policy_attachment ? length(var.iam_user_policy_attachment_policy_arns) : 0

  user       = var.iam_user_policy_attachment_user != "" && !var.enable_iam_user ? var.iam_user_policy_attachment_user : element(concat(aws_iam_user.iam_user.*.name, [""]), 0)
  policy_arn = var.iam_user_policy_attachment_policy_arns

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_iam_user.iam_user
  ]
}
