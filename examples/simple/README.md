# Simple Example

```terraform
module "terraform_snowflake_user" {
  source  = "../../"
  name = "test-account"
}
```

## Usage
```
terraform init
terraform plan -out tfplan
terraform apply tfplan
```
