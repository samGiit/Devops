provider "aws" {
    region = "us-east-1"
    access_key = "your access-key"
    secret_key = "your secret-key"
             
}    
resource "aws_instance" "mytestec2" {
    ami ="ami-0440d3b780d96b29d"   
    instance_type = "t2.micro"
    count = 3
     tags = {
      Name = var.ec2name[count.index]
    }
    
}
variable "ec2name" {
    type = list
    default = ["dev_ec2", "stage_ec2", "prod_ec2"]

}

variable "lbtf" {
    type = list
    default = ["devlb", "stagelb", "prodlb"]

}
resource "aws_iam_user" "lbuser" {
    name = var.lbtf[count.index]
    count = 3
    path = "/system/"
}
    