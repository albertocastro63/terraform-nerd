/**
 * security_group module outputs
 */

output "security_group_id" {
  value = aws_security_group.thesecuritygroup.id
}