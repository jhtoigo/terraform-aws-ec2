output "ec2_id" {
  description = "The ID of the instance"
  value       = aws_instance.instance.id
}

output "ec2_availability_zone" {
  description = "The availability zone of the created instance"
  value       = aws_instance.instance.availability_zone
}

output "ec2_ip_address" {
  description = "EC2 instance Private IP Address"
  value       = aws_instance.instance.private_ip
}
