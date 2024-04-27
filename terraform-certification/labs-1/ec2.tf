provider "aws" {
   region = "us-east-1"
   access_key = "your access-key"
   secret_key = "your secret-key"
             
}    
resource "aws_instance" "mytestec2" {
    ami ="ami-0440d3b780d96b29d"   
    instance_type = "t2.micro"
    
    tags = {
      Name = "ec2-sam"
    }
}