terraform {
    backend "s3" {
        bucket = "terra-state-2936"
        key = "terraform/backend"
        region = "us-east-1"
    
    }

}