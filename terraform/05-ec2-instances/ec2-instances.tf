resource "aws_instance" "http_server" {
    ami = "ami-069aabeee6f53e7bf"
    key_name = "default-ec2"
    instance_type = "t2.micro"
    vcp_security_group_ids = [aws_security_group.http_server_sg.id]
    subnet_id = "subnet-00455aaafc456df5a"
}