variable "ami-type" {
  type    = string
  default = "t2.nano"
}

variable "aws_common_tag" {
  type        = map(string)
  description = "set aws tag"
  default = {
    Name : "ec2-sam"
  }
}

