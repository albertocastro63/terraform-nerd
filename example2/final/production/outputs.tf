/**
 * Production Module Outputs.
 */

output "public_ip_web_server" {
  value = module.production_web.public_ip_web_server
}

output "az_web_server" {
  value = module.production_web.az_web_server
}

output "public_ip_app_server" {
  value = module.production_web.public_ip_app_server
}

output "az_app_server" {
  value = module.production_web.az_app_server
}

output "web_security_group_id" {
  value = module.production_web.web_security_group_id
}

output "app_security_group_id" {
  value = module.production_web.app_security_group_id
}

output "bucket_name" {
  value = module.production_web.bucket_name
}