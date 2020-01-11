/**
 * Web and Application Servers Outputs.
 */

output "public_ip_web_server" {
  value = module.web-server.public_ip
}

output "az_web_server" {
  value = module.web-server.availability_zone
}

output "public_ip_app_server" {
  value = module.application-server.public_ip
}

output "az_app_server" {
  value = module.application-server.availability_zone
}

output "web_security_group_id" {
  value = module.web-security-group.security_group_id
}

output "app_security_group_id" {
  value = module.application-security-group.security_group_id
}
