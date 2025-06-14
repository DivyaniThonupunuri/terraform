variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f" 
    description = "value of the ami id" 
  
}

variable "instance_type" {
    default = "t3.micro"

}

variable "ec2_tags" {
    default = {
        Name = "Hello world"
    }
     

}

variable "sg_name" {
        default = "allow-all"
         
  
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    type = number
    default = 0
}

variable "cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}


variable "protocol" {
    type = string
    default = "-1"
}

variable "ipv6_cidr_blocks" {
    type = list(string)
    default = [ "::/0" ]
}

variable "sg_tags" {
    default = {
        Name = "allow-all"
    }
}

variable "ingress_ports" {
    default = [
        {
            from_port = 22
            to_port   = 22
        } ,
        
        {
            from_port = 80
            to_port   = 80
        } , 

        {
            from_port = 8080
            to_port   = 8080
        }
    ]

}