provider "snowflake" {}

provider "context" {
  properties = {
    "environment" = {}
    "name"        = {}
    "Terraform"   = {}

  }

  delimiter = "_"

  values = {
    environment = "dev"
    stage       = "snow"
    "Terraform" = true
  }
}
