terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my_s3_bucket" {

    bucket = "my-s3-bucket-in28minutes-lm-training-tf-02"
}

resource "aws_iam_user" "my_iam_user" {
	name = "my_iam_user_abc"
} 

output "my_s3_bucket_versioning" {
	value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}
