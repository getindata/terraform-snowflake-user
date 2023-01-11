output "display_name" {
  description = "Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login."
  value       = module.terraform_snowflake_user.display_name
}
output "login_name" {
  description = "The name users use to log in."
  value       = module.terraform_snowflake_user.login_name
}
output "default_role" {
  description = "Specifies the role that is active by default for the user's session upon login."
  value       = module.terraform_snowflake_user.default_role
}
