terraform {
    backend "s3" {
        bucket = "dev-applications-backend-state-in28minutes-lair"
        key = "07-backend-state/users/backend-state"
        region = "us-east-1"
        dynamodb_table = "dev_application_locks"
        encrypt = true
    }
}