
resource "aws_eip" "lb" {
  domain = "vpc"
 #s tags   = var.aws_common_tag

}
output "eip_allocation_id" {
  description = "The ID of the EBS volume"
  value       = aws_eip.lb.allocation_id
 }
