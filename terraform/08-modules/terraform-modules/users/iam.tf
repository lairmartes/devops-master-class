resource "aws_iam_user" "my_iam_user" {
	name = "${var.environment}_my_iam_user_lair_tf"
}
