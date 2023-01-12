locals {
  name_from_descriptor = module.user_label.enabled ? trim(replace(
    lookup(module.user_label.descriptors, var.descriptor_name, module.user_label.id), "/${module.user_label.delimiter}${module.user_label.delimiter}+/", module.user_label.delimiter
  ), module.user_label.delimiter) : null

  rsa_public_key = var.generate_rsa_key ? join("", split("\n", trim(one(resource.tls_private_key.this[*].public_key_pem), "- \n BEGIN END PUBLIC KEY"))) : var.rsa_public_key
}
