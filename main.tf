module "user_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = module.this.context

  delimiter           = coalesce(module.this.context.delimiter, "_")
  regex_replace_chars = coalesce(module.this.context.regex_replace_chars, "/[^_a-zA-Z0-9]/")
  label_value_case    = coalesce(module.this.context.label_value_case, "upper")
}

resource "tls_private_key" "this" {
  count = module.this.enabled && local.generate_rsa_key ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_password" "this" {
  count = module.this.enabled && local.generate_password ? 1 : 0

  length           = 36
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "snowflake_user" "this" {
  count = module.this.enabled && !var.ignore_changes_on_defaults && upper(var.type) == "PERSON" ? 1 : 0

  name         = local.name_from_descriptor
  login_name   = var.login_name
  display_name = var.display_name
  comment      = var.comment

  password             = var.generate_password ? one(random_password.this[*].result) : null
  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa

  email       = var.email
  first_name  = var.first_name
  middle_name = var.middle_name
  last_name   = var.last_name

  default_namespace              = var.default_namespace
  default_warehouse              = var.default_warehouse
  default_role                   = var.default_role
  default_secondary_roles_option = var.default_secondary_roles_option #'DEFAULT', 'ALL', 'NONE'

  rsa_public_key   = local.rsa_public_key
  rsa_public_key_2 = var.rsa_public_key_2

  query_tag      = var.query_tag
  timezone       = var.timezone
  network_policy = var.network_policy

  trace_level                          = var.trace_level
  log_level                            = var.log_level
  enable_unredacted_query_syntax_error = var.enable_unredacted_query_syntax_error
}

resource "snowflake_user" "defaults_not_enforced" {
  count = module.this.enabled && var.ignore_changes_on_defaults && upper(var.type) == "PERSON" ? 1 : 0

  name         = local.name_from_descriptor
  login_name   = var.login_name
  display_name = var.display_name
  comment      = var.comment

  password             = var.generate_password ? one(random_password.this[*].result) : null
  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa

  email       = var.email
  first_name  = var.first_name
  middle_name = var.middle_name
  last_name   = var.last_name

  default_namespace              = var.default_namespace
  default_warehouse              = var.default_warehouse
  default_role                   = var.default_role
  default_secondary_roles_option = var.default_secondary_roles_option #'DEFAULT', 'ALL', 'NONE'

  rsa_public_key   = local.rsa_public_key
  rsa_public_key_2 = var.rsa_public_key_2

  query_tag      = var.query_tag
  timezone       = var.timezone
  network_policy = var.network_policy

  trace_level                          = var.trace_level
  log_level                            = var.log_level
  enable_unredacted_query_syntax_error = var.enable_unredacted_query_syntax_error

  lifecycle {
    ignore_changes = [
      default_namespace,
      default_warehouse,
      default_role,
    ]
  }
}

resource "snowflake_service_user" "this" {
  count = module.this.enabled && upper(var.type) == "SERVICE" ? 1 : 0

  name         = local.name_from_descriptor
  login_name   = var.login_name
  display_name = var.display_name

  comment = var.comment
  email   = var.email

  default_warehouse              = var.default_warehouse
  default_secondary_roles_option = var.default_secondary_roles_option
  default_role                   = var.default_role
  default_namespace              = var.default_namespace

  rsa_public_key   = local.rsa_public_key
  rsa_public_key_2 = var.rsa_public_key_2

  query_tag      = var.query_tag
  timezone       = var.timezone
  network_policy = var.network_policy

  trace_level                          = var.trace_level
  log_level                            = var.log_level
  enable_unredacted_query_syntax_error = var.enable_unredacted_query_syntax_error
}

resource "snowflake_legacy_service_user" "this" {
  count = module.this.enabled && upper(var.type) == "LEGACY_SERVICE" ? 1 : 0

  name         = local.name_from_descriptor
  login_name   = var.login_name
  display_name = var.display_name

  password             = var.generate_password ? one(random_password.this[*].result) : null
  must_change_password = var.must_change_password

  comment = var.comment
  email   = var.email

  default_warehouse              = var.default_warehouse
  default_secondary_roles_option = var.default_secondary_roles_option
  default_role                   = var.default_role
  default_namespace              = var.default_namespace

  query_tag      = var.query_tag
  timezone       = var.timezone
  network_policy = var.network_policy

  trace_level                          = var.trace_level
  log_level                            = var.log_level
  enable_unredacted_query_syntax_error = var.enable_unredacted_query_syntax_error
}

resource "snowflake_grant_account_role" "default_role" {
  count = module.this.enabled && var.grant_default_roles && var.default_role != null ? 1 : 0

  user_name = one(local.snowflake_user[*].name)
  role_name = var.default_role
}
