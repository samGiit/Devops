provider "aws" {
  region     = "us-east-1"
  access_key = "your access-key"
  secret_key = "your secret-key"
}
module "sg" {
  source = "../modules/sg"
  
}

module "public_ip" {
  source = "../modules/public"
  
}

module "ebs" {
  source = "../modules/ebs"
  
  
}

module "ec2" {
  source = "../modules/ec2"  

}


resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ebs_volume_id
  instance_id = module.ec2.ec2_instance_id
}

resource "aws_eip_association" "eip_assoc" {
  depends_on    = [module.public_ip]
  instance_id   = module.ec2.ec2_instance_id
  allocation_id = module.public_ip.eip_allocation_id
  
}
