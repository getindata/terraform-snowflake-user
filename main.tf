data "context_config" "this" {}

data "context_label" "user" {
  properties = var.context_properties
  template   = var.context_template
  values = {
    name = var.name
  }
}

resource "tls_private_key" "this" {
  count = data.context_config.this.enabled && local.generate_rsa_key ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_password" "this" {
  count = data.context_config.this.enabled && local.generate_password ? 1 : 0

  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "snowflake_user" "this" {
  count = data.context_config.this.enabled && !var.ignore_changes_on_defaults ? 1 : 0

  name         = data.context_label.user.rendered
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

resource "snowflake_user" "defaults_not_enforced" {
  count = data.context_config.this.enabled && var.ignore_changes_on_defaults ? 1 : 0

  name         = data.context_label.user.rendered
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

  lifecycle {
    ignore_changes = [
      default_namespace,
      default_warehouse,
      default_role,
    ]
  }
}

resource "snowflake_role_grants" "default_role" {
  count = data.context_config.this.enabled && var.grant_default_roles && var.default_role != null ? 1 : 0

  role_name = var.default_role
  users     = [one(local.snowflake_user[*].name)]
}
