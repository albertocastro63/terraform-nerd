/**
 * EC2 instance in AWS creted in terraform (v3).
 * Outputs.
 */

output "public_ip" {
  value = aws_instance.myapp.public_ip
}

output "availability_zone" {
  value = aws_instance.myapp.availability_zone
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_group.id
}


output "ec2_security_group_vpc_id" {
  value = aws_security_group.ec2_security_group.vpc_id
}