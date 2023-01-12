/*
* # Snowflake User
* 
* Terraform module can:
* * Create and manage Snowflake Users
* * Automatically generate RSA private and public keys for the user
*/
module "user_label" {
  count   = module.this.enabled ? 1 : 0
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context          = module.this.context
  label_key_case   = "lower"
  attributes       = ["snowflake", "rsa", "key"]
  label_value_case = "lower"
  delimiter        = "-"
}

resource "tls_private_key" "this" {
  count = var.generate_rsa_key ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "snowflake_user" "this" {
  count = module.this.enabled ? 1 : 0

  name         = local.name_from_descriptor
  login_name   = var.login_name
  display_name = var.display_name
  comment      = var.comment

  password             = var.password
  must_change_password = true # When password set here - always change password on login

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
