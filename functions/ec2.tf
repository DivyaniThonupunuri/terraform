resource "aws_instance" "Roboshop"{
    ami           = var.ami_id 
    count         = length(var.instance)
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    tags = merge (
        var.common_tags , 
        {
            Component = var.instance[count.index]
            Name = var.instance[count.index]
    }
    )
          
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

    tags = merge(
        var.common_tags,
        {
            Name= "allow-all"
        }
    )

}