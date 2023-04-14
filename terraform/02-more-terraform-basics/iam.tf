resource "aws_iam_user" "my_iam_users" {
	count = 2
	name = "my_iam_user_${count.index}"
}
