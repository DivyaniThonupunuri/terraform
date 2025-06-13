resource "aws_instance" "Roboshop"{
    ami           = var.ami_id 
    for_each      = toset(var.instance)
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    tags = {
            Name = each.key
    }
}


resource "aws_security_group" "allow_all" {
    name        = var.sg_name
    description = "allow all traffic"

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }

    tags = var.sg_tags
}