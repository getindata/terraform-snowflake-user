output "user_module_outputs" {
  description = "All user module outputs"
  value       = module.terraform_snowflake_user
  sensitive   = true
}
