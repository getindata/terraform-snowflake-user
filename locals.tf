locals {
  rsa_public_key    = var.generate_rsa_key ? join("", split("\n", trim(one(resource.tls_private_key.this[*].public_key_pem), "- \n BEGIN END PUBLIC KEY"))) : var.rsa_public_key
  generate_password = data.context_config.this.enabled && var.generate_password
  generate_rsa_key  = data.context_config.this.enabled && var.generate_rsa_key

  snowflake_user = var.type == "SERVICE" ? one(snowflake_service_user.this[*]) : var.type == "LEGACY_SERVICE" ? one(snowflake_legacy_service_user.this[*]) : var.type == "PERSON" && var.ignore_changes_on_defaults ? one(snowflake_user.defaults_not_enforced[*]) : one(snowflake_user.this[*])
}
