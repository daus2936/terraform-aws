variable REGION {
    default = "us-east-1"

}

variable ZONE1 {
    default = "us-east-1a"
}

variable AMIS {
    type = map
    default = {
        us-east-1 = "ami-005fc0f236362e99f"
        ap-southeast-1 = "ami-03fa85deedfcac80b"
    }
}

variable "USER" {
    default = "ubuntu"

}