terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }


  backend "s3"{
    bucket = "div-remote-state"
    key = "provisioners"
    region = "us-east-1"
    encrypt = true
    #dynamodb_table = "div-remote-state"
    use_lockfile = true #s3 native locking 
  }
}

provider "aws" {
  # Configuration options
}