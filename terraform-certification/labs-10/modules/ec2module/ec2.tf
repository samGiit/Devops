data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "mytestec2" {
  ami             = data.aws_ami.amzn-linux-2023-ami.id
  instance_type   = "t2.micro" 
  key_name        = "devops-sam"
  tags            = var.aws_common_tag
  security_groups = ["${aws_security_group.allow_http_https.name}"]

  provisioner "remote-exec" {
    inline = [
      #"sudo yum update -y",
      #"sudo systemctl start nginx",
      #"sudo systemctl enable nginx"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("")
    host        = self.public_ip
  }
}

resource "aws_security_group" "allow_http_https" {
  name        = var.sg_name
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
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_http_https.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_eip" "lb" {
  instance   = aws_instance.mytestec2.id
  domain = "vpc"
  tags   = var.aws_common_tag
  provisioner "local-exec" {
    command = "echo ID: ${aws_instance.mytestec2.id}; PUBLIC IP:${aws_eip.lb.public_ip}; AZ: ${aws_instance.mytestec2.availability_zone} > infos_ec2.txt"
  }
}



