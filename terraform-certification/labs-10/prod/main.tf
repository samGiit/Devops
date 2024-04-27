provider "aws" {
  region     = "us-east-1"
  access_key = "your access-key"
  secret_key = "your secret-key"
}
## create your own bucket on aws  before using this code
terraform {
  backend "s3" {
    bucket = "terraform-backend-files-sam" # put your bucket name
    key =   "demo.tfstate"
    region     = "us-east-1"
    access_key = "your access-key"
    secret_key = "your secret-key"
  }
}
module "ec2" {
  source = "../modules/ec2module"
  ami-type  = "t2.micro"
  aws_common_tag = {
    Name = "ec2-prod-sam"
  }
  sg_name = "prod-sam-sg"
}