# security group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "http_server_sg" {
    name = "http_server_sg"
    vpc_id = aws_default_vpc.default.id

    ingress {  
    
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {  
    
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress {

        from_port = 0 # all ports
        to_port = 0
        protocol = -1 # all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "http_server_sg"
    }
}