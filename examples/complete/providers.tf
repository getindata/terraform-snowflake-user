provider "snowflake" {}

provider "context" {
  properties = {
    "environment" = {}
    "name"        = { required = true }
    "Terraform"   = {}

  }

  delimiter = "_"

  values = {
    environment = "dev"
    stage       = "snow"
    "Terraform" = true
  }
}
