module "terraform_snowflake_user" {
  source            = "../../"
  context           = module.this.context
  generate_rsa_key  = true
  generate_password = true
}
