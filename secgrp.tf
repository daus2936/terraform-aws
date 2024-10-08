resource "aws_security_group" "vprofile-bean-elb-sg" {
    name = "vprofile-bean-elb-sg"
    description = "SG for beanstalk-elb"
    vpc_id = module.vpc.vpc_id

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "vprofile-bastion-sg" {
    name = "vprofile-bastion-sg"
    description = "SG for bastion host"
    vpc_id = module.vpc.vpc_id
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    } 

    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "vprofile-prod-sg" {
    name = "vprofile-prod-sg"
    description = "SG for beanstalk instances"
    vpc_id = module.vpc.vpc_id
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    } 

    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        security_groups = [aws_security_group.vprofile-bastion-sg.id]
    }
}

resource "aws_security_group" "vprofile-backend-sg" {
    name = "vprofile-backend-sg"
    description = "SG for backend"
    vpc_id = module.vpc.vpc_id
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    } 

    ingress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        security_groups = [aws_security_group.vprofile-prod-sg.id]
    }

    ingress {
        from_port = 3306
        protocol = "tcp"
        to_port = 3306
        security_groups = [aws_security_group.vprofile-bastion-sg]
    }
}

resource "aws_security_group_rule" "sec_group_allow_itself" {
    type = "ingress"
    from_port = 0
    protocol = "tcp"
    to_port = 65535
    source_security_group_id = aws_security_group.vprofile-backend-sg.id
    security_group_id = aws_security_group.vprofile-backend-sg.id
}

