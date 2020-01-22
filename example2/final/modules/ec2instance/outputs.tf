/**
 * EC2 instance in AWS creted in terraform (v3).
 * Outputs.
 */

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "availability_zone" {
  value = aws_instance.this.availability_zone
}

output "private_ip" {
  value = aws_instance.this.private_ip
}
