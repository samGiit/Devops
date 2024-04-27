provider "aws" {
    region = "us-east-1"
    access_key = "your access-key"
    secret_key = "your secret-key"
}    

resource "aws_eip" "myeip" {
    domain = "vpc"
  
}
output "myeipoutput" {
    value = aws_eip.myeip

}
resource "aws_s3_bucket" "mysbucket" {
    bucket = "test-bucket-sam"
  
}
output "mys3bucketoutput" {
    value = aws_s3_bucket.mysbucket
}
