variable REGION {
    default = "us-east-1"

}

variable ZONE1 {
    default = "us-east-1a"
}

variable ZONE2 {
    default = "us-east-1b"
}

variable ZONE3 {
    default = "us-east-1c"
}

variable AMIS {
    type = map
    default = {
        us-east-1 = "ami-005fc0f236362e99f"
        ap-southeast-1 = "ami-03fa85deedfcac80b"
    }
}


variable PRIV_KEY_PATH {
    default = "/home/ubuntu/.ssh/id_rsa"  
}

variable PUB_KEY_PATH {
    default = "/home/ubuntu/.ssh/id_rsa.pub"  
}

variable USERNAME {
    default = "ubuntu"
}

variable rmquser {
    default = "rabbit"
}

variable rmqpass {
    default = "R52&/3JJ%0ykr?"
}

variable dbuser {
    default = "admin"
}

variable dbpass {
    default = "admin123"
}

variable dbname {
    default = "accounts"
}

variable instance_count {
    default = "1"
  
}

variable VPC_NAME {
    default = "vprofile-vpc"
}

variable VPC_CIDR {
    default = "172.21.0.0/16"
}

variable PubSub1CIDR {
    default = "172.21.1.0/24"
}

variable PubSub2CIDR {
    default = "172.21.2.0/24"
}

variable PubSub3CIDR {
    default = "172.21.3.0/24"
}

variable PrivSub1CIDR {
    default = "172.21.4.0/24"
}

variable PrivSub2CIDR {
    default = "172.21.5.0/24"
}

variable PrivSub3CIDR {
    default = "172.21.6.0/24"
}