resource "aws_iam_user" "my_iam_user" {
	name = "${var.environment}_${local.iam_user_extension}"
}
