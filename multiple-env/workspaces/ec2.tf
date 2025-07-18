resource "aws_instance" "Roboshop"{
    ami           = var.ami_id 
    count         = length(var.instance)
    instance_type = lookup(var.instance_type , terraform.workspace )
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]

    tags = merge (
        var.common_tags , 
        {   
            Name = "${var.project}-${var.instance[count.index]}-${terraform.workspace}"
            Component = var.instance[count.index]
            Environment = terraform.workspace
    }
    )
          
}
# ALLOW ALL SG
resource "aws_security_group" "allow_all" {
    name        = "${var.project}-${var.sg_name}-${terraform.workspace}"
    description = var.sg_description

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
            Name= "${var.project}-${var.sg_name}-${terraform.workspace}" #roboshop-allowall-dev
        }
    )

}