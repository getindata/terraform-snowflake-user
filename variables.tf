variable "login_name" {
  description = "The name users use to log in. If not supplied, snowflake will use name instead."
  type        = string
  default     = null
}

variable "display_name" {
  description = "Name displayed for the user in the Snowflake web interface."
  type        = string
  default     = null
}

variable "comment" {
  description = "Comment / description of Snowflake user"
  type        = string
  default     = null
}

variable "email" {
  description = "Email address for the user"
  type        = string
  default     = null
}

variable "first_name" {
  description = "First name of the user"
  type        = string
  default     = null
}

variable "last_name" {
  description = "Last name of the user"
  type        = string
  default     = null
}

variable "default_namespace" {
  description = "Specifies the namespace (database only or database and schema) that is active by default for the user's session upon login."
  type        = string
  default     = null
}

variable "default_warehouse" {
  description = "Specifies the virtual warehouse that is active by default for the user's session upon login."
  type        = string
  default     = null
}

variable "default_role" {
  description = "Specifies the role that is active by default for the user's session upon login."
  type        = string
  default     = null
}

variable "default_secondary_roles" {
  description = <<EOT
    Specifies the set of secondary roles that are active for the user's session upon login. 
    Secondary roles are a set of roles that authorize any SQL action other than the execution of CREATE <object> statements. 
    Currently only ["ALL"] value is supported
  EOT
  type        = list(string)
  default     = []
  validation {
    condition     = var.default_secondary_roles == null || contains([0, 1], length(var.default_secondary_roles)) || contains(var.default_secondary_roles, "ALL")
    error_message = "Currently only [\"ALL\"] value is supported by Snowflake provider."
  }
}

variable "rsa_public_key" {
  description = "Specifies the user's RSA public key; used for key-pair authentication. Must be on 1 line without header and trailer."
  type        = string
  default     = null
}

variable "rsa_public_key_2" {
  description = <<EOT
    Specifies the user's second RSA public key; used to rotate the public and private keys 
    for key-pair authentication based on an expiration schedule set by your organization. 
    Must be on 1 line without header and trailer."
  EOT
  type        = string
  default     = null
}

variable "generate_rsa_key" {
  description = <<EOT
    Whether automatically generate an RSA key - IMPORTANT 
    The private key generated by this resource will be stored 
    unencrypted in your Terraform state file. 
    Use of this resource for production deployments is not recommended.
  EOT
  type        = bool
  default     = false
}

variable "descriptor_name" {
  description = "Name of the descriptor used to form a Snowflake User name"
  type        = string
  default     = "snowflake-user"
}

variable "generate_password" {
  description = "Generate a random password using Terraform"
  type        = bool
  default     = false
}

variable "must_change_password" {
  description = "Should the user change the password on login. Should be set to true for non service account users"
  type        = bool
  default     = true
}

variable "grant_default_roles" {
  description = "Whether to grant default_role to Snowflake User"
  type        = bool
  default     = true
}

variable "ignore_changes_on_defaults" {
  description = "Whether to ignore configuration of `default_warehouse`, `default_role` and `default_namespace`"
  type        = bool
  default     = false
}
