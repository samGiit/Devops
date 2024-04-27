provider "aws" {
    region = "us-east-1"
    access_key = "your access-key"
    secret_key = "your secret-key"
             
}    
resource "aws_instance" "mytestec2" {
    ami ="ami-0440d3b780d96b29d"   
    instance_type = var.types["us-west-2"]
    
    tags = {
      Name = "ec2-sam"
    }
}
variable "list" {
    type = list
    default = ["m5.large", "m5.xlarge", "t2.medium"]
  
}
variable "types" {
    type = map
    default = {
        us-east-1 = "t2.micro"
        us-west-2 = "t2.nano"
        ap-south-1 = "t2.small"
    }
  
}