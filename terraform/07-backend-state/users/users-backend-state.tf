variable application_name {
    default = "07-backend-state"
}

variable project_name {
    default = "users"
}

variable environment {
    default = "dev"
}

terraform {
    backend "s3" {
        bucket = "dev-applications-backend-state-in28minutes-lair"
        key = "${var.application_name}-${var.project_name}-${var.environment}"
        region = "us-east-1"
        dynamodb_table = "dev_application_locks"
        encrypt = true
    }
}