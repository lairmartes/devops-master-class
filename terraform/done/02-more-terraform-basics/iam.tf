variable "iam_user_name_prefix" {
	type = string # supported: any, number, bool, list, map, set, object, tuple
	# default = "my_iam_user" <- being defined in terraform.tfvars
}

resource "aws_iam_user" "my_iam_users" {
	count = 2
	name = "${var.iam_user_name_prefix}_${count.index}"
}
