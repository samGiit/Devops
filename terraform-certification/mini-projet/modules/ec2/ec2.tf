
resource "aws_instance" "mytestec2" {
  ami             =  "ami-05adadbbe8cf9fb48 "
  instance_type   = var.instance-size
  key_name        = "devops-sam"
  tags            = var.instance-tag
  #security_groups = ["${aws_security_group.allow_http_https.name}"]

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
    private_key = file("path of your .pem file")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo ID: ${aws_instance.mytestec2.id}; PUBLIC IP:${aws_instance.mytestec2.public_ip}; AZ: ${aws_instance.mytestec2.availability_zone} > infos_ec2.txt"
  }
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.mytestec2.ami
}






