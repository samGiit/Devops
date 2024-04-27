provider "aws" {
  region     = "us-east-1"
  access_key = "your access-key"
  secret_key = "your secret-key"

}

data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "mytestec2" {
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "var.ami-type"
  key_name      = "devops-sam"

  tags            = var.aws_common_tag
  security_groups = ["$(aws_security_group.allow_http_https.id)"]
}

resource "aws_eip" "lb" {
  instance = aws_instance.mytestec2.id
  domain   = "vpc"
}
resource "aws_security_group" "allow_http_https" {
  name        = "security-group"
  description = "allow_http_https"

}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_http_https.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http_https.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}