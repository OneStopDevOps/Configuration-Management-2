# Output variable that holds the public IP of the AWS EC2 instance
output "public_ip" {
  value = aws_instance.ec2.public_ip
} 