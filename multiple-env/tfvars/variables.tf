variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f" 
    description = "value of the ami id" 
  
}

variable "project" {
  default = "Roboshop"
}

variable "environment" {
  
}
variable "instance_type" {

}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "backend server"
    }
    
}

variable "sg_name" {
        default = "allow-all"      
  
}

variable "sg_description" {
  default = "allowing all ports from all IP"
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



variable "instance" {
    default = ["frontend", "mongodb"]

}

variable "zone_ID" {
  default = "Z0193703QQF97X2DHTUG"
}

variable "domain_name" {
  default = "devsecops-dt.site"
}

variable "common_tags"{
    default = {
        Project = "roboshop"
        Terraform = "true"
    }
}