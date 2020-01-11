/**
 * EC2 instance in AWS creted in terraform (v3).
 * Outputs.
 */

output "public_ip" {
  value = aws_instance.theinstance.public_ip
}

output "availability_zone" {
  value = aws_instance.theinstance.availability_zone
}


output "private_ip" {
  value = aws_instance.theinstance.private_ip
}
