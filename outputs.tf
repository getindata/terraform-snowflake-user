output "default_namespace" {
  description = "Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login"
  value       = one(local.snowflake_user[*].default_namespace)
}

output "default_role" {
  description = "Specifies the role that is active by default for the user's session upon login"
  value       = one(local.snowflake_user[*].default_role)
}

output "default_warehouse" {
  description = "Specifies the virtual warehouse that is active by default for the user's session upon login"
  value       = one(local.snowflake_user[*].default_warehouse)
}

output "disabled" {
  description = "Whether user account is disabled"
  value       = one(local.snowflake_user[*].disabled)
}

output "login_name" {
  description = "The name users use to log in"
  value       = one(local.snowflake_user[*].login_name)
}

output "name" {
  description = "Name of the user"
  value       = one(local.snowflake_user[*].name)
}

output "display_name" {
  description = "Name displayed for the user in the Snowflake web interface"
  value       = one(local.snowflake_user[*].display_name)
}

output "first_name" {
  description = "First name of the user"
  value       = one(local.snowflake_user[*].first_name)
}

output "last_name" {
  description = "Last name of the user"
  value       = one(local.snowflake_user[*].last_name)
}

output "email" {
  description = "Email address for the user"
  value       = one(local.snowflake_user[*].email)
}

output "password" {
  description = "Password set for the user"
  value       = one(random_password.this[*].result)
  sensitive   = true
}

output "rsa_private_key" {
  description = "RSA Private key used for authentication"
  value       = one(tls_private_key.this[*].private_key_pem)
  sensitive   = true
}
