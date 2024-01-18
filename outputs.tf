output "default_namespace" {
  description = "Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].default_namespace) : one(snowflake_user.defaults_not_enforced[*].default_namespace)
}

output "default_role" {
  description = "Specifies the role that is active by default for the user's session upon login"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].default_role) : one(snowflake_user.defaults_not_enforced[*].default_role)
}

output "default_warehouse" {
  description = "Specifies the virtual warehouse that is active by default for the user's session upon login"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].default_warehouse) : one(snowflake_user.defaults_not_enforced[*].default_warehouse)
}

output "disabled" {
  description = "Whether user account is disabled"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].disabled) : one(snowflake_user.defaults_not_enforced[*].disabled)
}

output "login_name" {
  description = "The name users use to log in"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].login_name) : one(snowflake_user.defaults_not_enforced[*].login_name)
}

output "name" {
  description = "Name of the user"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].name) : one(snowflake_user.defaults_not_enforced[*].name)
}

output "display_name" {
  description = "Name displayed for the user in the Snowflake web interface"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].display_name) : one(snowflake_user.defaults_not_enforced[*].display_name)
}

output "first_name" {
  description = "First name of the user"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].first_name) : one(snowflake_user.defaults_not_enforced[*].first_name)
}

output "last_name" {
  description = "Last name of the user"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].last_name) : one(snowflake_user.defaults_not_enforced[*].last_name)
}

output "email" {
  description = "Email address for the user"
  value       = var.enforce_defaults ? one(snowflake_user.this[*].email) : one(snowflake_user.defaults_not_enforced[*].email)
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
