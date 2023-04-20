resource "aws_elb" "elb" {
    name = "elb"
    subnets = toset(data.aws_subnet_ids.default_subnets.ids)
    security_groups = [aws_security_group.elb_sg.id]
    instances = values(aws_instance.http_servers).*.id

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
}
