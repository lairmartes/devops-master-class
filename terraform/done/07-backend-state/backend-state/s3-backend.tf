resource "aws_s3_bucket" "enterprise_backend_state" {
    bucket = "dev-applications-backend-state-in28minutes-lair"

    lifecycle {
        prevent_destroy = true
    }

}

resource "aws_s3_bucket_versioning" "backend_state_versioning" {
    bucket = aws_s3_bucket.enterprise_backend_state.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_state_encryption" {

    bucket = aws_s3_bucket.enterprise_backend_state.id

    rule {
        apply_server_side_encryption_by_default {
            
            sse_algorithm = "AES256"
        }
    }
}