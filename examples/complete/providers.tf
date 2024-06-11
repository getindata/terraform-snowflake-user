provider "snowflake" {}

provider "context" {
  properties = {
    "stage"     = {}
    "name"      = { required = true }
    "Terraform" = {}
  }

  delimiter = "_"

  values = {
    stage       = "DEV"
    "Terraform" = true
  }
}
