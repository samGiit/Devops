provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}
## create your own bucket on aws  before using this code
terraform {
  backend "s3" {
    bucket = "terraform-backend-files-sam" # put your bucket name
    key =   ""
    region     = "us-east-1"
    access_key = ""
    secret_key = ""
  }
}
module "ec2" {
  source = "../modules/ec2module"
  ami-type = "t2.nano"
  aws_common_tag = {
    Name ="ec2-dev-sam"
  }
  sg_name = "dev-sam-sg"
}