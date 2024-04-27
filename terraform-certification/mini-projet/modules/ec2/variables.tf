
variable "instance-size" {
  type = string
  default = "t2.nano"  
}

variable "instance-tag" {
  type        = map(string)
  description = "set aws tag"
  default = {
    Name : "ec2-sam"
  }
}
