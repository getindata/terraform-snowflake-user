output "user_1" {
  description = "All user module outputs"
  value       = module.terraform_snowflake_user_1
  sensitive   = true
}

output "user_2" {
  description = "All user module outputs"
  value       = module.terraform_snowflake_user_2
  sensitive   = true
}

output "service_user" {
  description = "All user module outputs"
  value       = module.terraform_snowflake_service_user
  sensitive   = true
}

output "legacy_service_user" {
  description = "value of the legacy_service_user output"
  value       = module.terraform_snowflake_legacy_service_user
  sensitive   = true
}
