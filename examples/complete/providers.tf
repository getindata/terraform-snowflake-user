provider "snowflake" {}

provider "context" {
  properties = {
    "environment" = {}
    "stage"       = {}
    "name"        = { required = true }
    "Terraform"   = {}
  }

  delimiter = "_"

  values = {
    environment = "DEV"
    stage       = "Snowflake"
    "Terraform" = true
  }
}
