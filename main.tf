/*
* # Snowflake User
* 
* Terraform module can:
* * Create and manage Snowflake Users
* * Automatically generate RSA private and public keys for the user
* * Grant `default_role` and `default_secondary_roles` to Snowflake User
*/
module "user_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = module.this.context

  delimiter           = coalesce(module.this.context.delimiter, "_")
  regex_replace_chars = coalesce(module.this.context.regex_replace_chars, "/[^_a-zA-Z0-9]/")
  label_value_case    = coalesce(module.this.context.label_value_case, "upper")
}

resource "tls_private_key" "this" {
  count = local.generate_rsa_key ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_password" "this" {
  count            = local.generate_password ? 1 : 0
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "snowflake_user" "this" {
  count = module.this.enabled ? 1 : 0

  name         = local.name_from_descriptor
  login_name   = var.login_name
  display_name = var.display_name
  comment      = var.comment

  password             = one(random_password.this[*].result)
  must_change_password = var.must_change_password

  email      = var.email
  first_name = var.first_name
  last_name  = var.last_name

  default_namespace       = var.default_namespace
  default_warehouse       = var.default_warehouse
  default_role            = var.default_role
  default_secondary_roles = var.default_secondary_roles

  rsa_public_key   = local.rsa_public_key
  rsa_public_key_2 = var.rsa_public_key_2
}

resource "snowflake_role_grants" "default_role" {
  count = var.grant_default_roles && var.default_role != null ? 1 : 0

  role_name = var.default_role
  users     = [one(resource.snowflake_user.this[*].name)]
}

resource "snowflake_role_grants" "default_secondary_roles" {
  for_each = var.grant_default_roles ? toset(var.default_secondary_roles) : []

  role_name = each.key
  users     = [one(resource.snowflake_user.this[*].name)]
}
