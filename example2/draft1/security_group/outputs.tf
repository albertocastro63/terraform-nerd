/**
 * security_group module outputs
 */

output "security_group_id" {
  value = aws_security_group.ec2_security_group.id
}