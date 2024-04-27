

resource "aws_ebs_volume" "ebs_prod" {
  availability_zone = "us-east-1"
  size              = var.ebs_size

  tags = {
    Name = "sam-ebs-prod"
  }
  
}
output "ebs_volume_id" {
  description = "The ID of the EBS volume"
  value       = aws_ebs_volume.ebs_prod.id
 }
