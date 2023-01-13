# Complete Example

```terraform
module "terraform_snowflake_user" {
  source  = "../../"
  context = module.this.context
  name = "test-account"
 
}
```

## Usage
```
terraform init
terraform plan -var-file fixtures.tfvars -out tfplan
terraform apply tfplan
```
