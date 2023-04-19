variable "iam_names" {
	type = list
}

resource "aws_iam_user" "my_iam_users" {
	for_each = toset(var.iam_names)
	name = each.value
}
