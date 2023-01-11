locals {
  name_from_descriptor = module.this.enabled ? trim(replace(
    lookup(module.this.descriptors, var.descriptor_name, module.this.id), "/${module.this.delimiter}${module.this.delimiter}+/", module.this.delimiter
  ), module.this.delimiter) : null

  rsa_public_key = var.generate_rsa_key ? join("", split("\n", trim(one(resource.tls_private_key.this[*].public_key_pem), "- \n BEGIN END PUBLIC KEY"))) : var.rsa_public_key
}
