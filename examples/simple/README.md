# Simple Example

```terraform
module "terraform_snowflake_user" {
  source  = "../../"

  example_var = "This is a example value."
}
```

## Usage
```
terraform init
terraform plan -out tfplan
terraform apply tfplan
```
