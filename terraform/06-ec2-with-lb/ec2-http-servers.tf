resource "aws_instance" "http_servers" {

    ami = data.aws_ami.aws_linux_2_latest.id
    key_name = "default-ec2"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.http_server_sg.id]

    for_each = toset(data.aws_subnets.default_subnets.ids)
    subnet_id = each.value

    tags = {
        name: "http_servers_${each.value}"
    }

    connection {

        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        private_key = file(var.aws_key_pair_file_name)
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y", # install http server
            "sudo service httpd start", # start http server
            "echo Welcome to 1st Lair EC2 instance - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html" 
              # ^ create html content and include in the file0
        ]
    
    }
}