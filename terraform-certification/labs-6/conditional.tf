provider "aws" {
    region = "us-east-1"
    access_key = "your access-key"
    secret_key = "your secret-key"
             
}    
resource "aws_instance" "dev" {
    ami ="ami-0440d3b780d96b29d"   
    instance_type = "t2.micro"
    count = var.testing == false ? 1 : 0
     
}
    resource "aws_instance" "prod" {
    ami ="ami-0440d3b780d96b29d"   
    instance_type = "t2.micro"
    count = var.testing == true ? 3 : 0
    tags = {
      Name = var.ec2name[count.index]
    }
     
}
variable "testing" {
  
}
variable "ec2name" {
    type = list
    default = ["prod3", "prod1", "prod_2"]

}