locals {
  rsa_public_key    = var.generate_rsa_key ? join("", split("\n", trim(one(resource.tls_private_key.this[*].public_key_pem), "- \n BEGIN END PUBLIC KEY"))) : var.rsa_public_key
  generate_password = data.context_config.this.enabled && var.generate_password
  generate_rsa_key  = data.context_config.this.enabled && var.generate_rsa_key

  snowflake_user = var.ignore_changes_on_defaults ? snowflake_user.defaults_not_enforced : snowflake_user.this
}
