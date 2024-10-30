context_templates = {
  snowflake-user         = "{{.environment}}_{{.name}}"
  snowflake-service-user = "{{.environment}}_{{.project}}_{{.name}}_svc"
}
