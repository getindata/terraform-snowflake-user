output "default_namespace" {
  description = "Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login"
  value       = local.snowflake_user.default_namespace
}

output "default_role" {
  description = "Specifies the role that is active by default for the user's session upon login"
  value       = nonsensitive(local.snowflake_user.default_role)
}

output "default_warehouse" {
  description = "Specifies the virtual warehouse that is active by default for the user's session upon login"
  value       = local.snowflake_user.default_warehouse
}

output "default_secondary_roles_option" {
  description = "Specifies the secondary roles that are active for the user’s session upon login"
  value       = local.snowflake_user.default_secondary_roles_option
}

output "disabled" {
  description = "Whether user account is disabled"
  value       = local.snowflake_user.disabled
}

output "login_name" {
  description = "The name users use to log in"
  value       = local.snowflake_user.login_name
  sensitive   = true
}

output "name" {
  description = "Name of the user"
  value       = local.snowflake_user.name
}

output "display_name" {
  description = "Name displayed for the user in the Snowflake web interface"
  value       = nonsensitive(local.snowflake_user.display_name)
}

output "first_name" {
  description = "First name of the user (only if `type == PERSON`)"
  value       = var.type == "PERSON" ? local.snowflake_user.first_name : null
}

output "middle_name" {
  description = "Middle name of the user (only if `type == PERSON`)"
  value       = var.type == "PERSON" ? local.snowflake_user.middle_name : null
}

output "last_name" {
  description = "Last name of the user (only if `type == PERSON`)"
  value       = var.type == "PERSON" ? local.snowflake_user.last_name : null
}

output "email" {
  description = "Email address for the user"
  value       = local.snowflake_user.email
}

output "password" {
  description = "Password set for the user (only if `type == PERSON` or `type == LEGACY_SERVICE`)"
  value       = one(random_password.this[*].result)
  sensitive   = true
}

output "rsa_private_key" {
  description = "RSA Private key used for authentication"
  value       = one(tls_private_key.this[*].private_key_pem)
  sensitive   = true
}


output "query_tag" {
  description = "Query tag"
  value       = local.snowflake_user.query_tag
}

output "timezone" {
  description = "Timezone"
  value       = local.snowflake_user.timezone
}

output "network_policy" {
  description = "Network policy associated with the user"
  value       = local.snowflake_user.network_policy
}

output "trace_level" {
  description = "Trace level"
  value       = local.snowflake_user.trace_level
}

output "log_level" {
  description = "Log level"
  value       = local.snowflake_user.log_level
}

output "enable_unredacted_query_syntax_error" {
  description = "Enable access to unredacted query syntax error for the user"
  value       = local.snowflake_user.enable_unredacted_query_syntax_error
}

output "disable_mfa" {
  description = "Whether multi-factor authentication is disabled for the user"
  value       = var.type == "PERSON" ? local.snowflake_user.disable_mfa : null
}

output "type" {
  description = "User type"
  value       = var.type
}
