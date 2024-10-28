data "context_config" "this" {}

data "context_label" "this" {
  properties = local.context_template == null ? var.context_properties : null
  template   = local.context_template
  values = {
    name = var.name
  }
}

resource "tls_private_key" "this" {
  count = local.generate_rsa_key ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_password" "this" {
  count = local.generate_password ? 1 : 0

  length           = 36
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "snowflake_user" "this" {
  count = !var.ignore_changes_on_defaults && upper(var.type) == "PERSON" ? 1 : 0

  name         = data.context_label.this.rendered
  login_name   = var.login_name
  display_name = var.display_name
  comment      = var.comment

  password             = var.generate_password ? one(random_password.this[*].result) : null
  must_change_password = var.must_change_password
  disabled             = var.disabled
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
  count = var.ignore_changes_on_defaults && upper(var.type) == "PERSON" ? 1 : 0

  name         = data.context_label.this.rendered
  login_name   = var.login_name
  display_name = var.display_name
  comment      = var.comment

  password             = var.generate_password ? one(random_password.this[*].result) : null
  must_change_password = var.must_change_password
  disabled             = var.disabled
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
  count = upper(var.type) == "SERVICE" ? 1 : 0

  name         = data.context_label.this.rendered
  login_name   = var.login_name
  display_name = var.display_name

  comment  = var.comment
  email    = var.email
  disabled = var.disabled

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
  count = upper(var.type) == "LEGACY_SERVICE" ? 1 : 0

  name         = data.context_label.this.rendered
  login_name   = var.login_name
  display_name = var.display_name
  disabled     = var.disabled

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
  count = data.context_config.this.enabled && var.grant_default_roles && var.default_role != null ? 1 : 0

  user_name = one(local.snowflake_user[*].name)
  role_name = var.default_role
}
