provider "snowflake" {}

provider "context" {
  properties = {
    "environment" = {}
    "stage"       = {}
    "name"        = { required = true }
    "Terraform"   = {}
    #svc-suffix    = {}
  }

  delimiter = "_"

  values = {
    environment = "dev"
    stage       = "snow"
    "Terraform" = true
    #svc-suffix  = "svc"
  }
}
