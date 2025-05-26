##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

resource "aws_kms_key" "this" {
  count                   = try(var.configs.encryption.enabled, false) ? 1 : 0
  description             = try(var.configs.encryption.description, "KMS Key for sqs-${local.system_name}-key")
  deletion_window_in_days = try(var.configs.encryption.deletion_window_in_days, 30)
  enable_key_rotation     = try(var.configs.encryption.enable_key_rotation, true)
  is_enabled              = try(var.configs.encryption.is_enabled, true)
  tags                    = local.all_tags
}

resource "aws_kms_alias" "this" {
  count         = try(var.configs.encryption.enabled, false) ? 1 : 0
  name          = try(var.configs.encryption.alias, "alias/sqs-${local.system_name}-key")
  target_key_id = aws_kms_key.this[0].key_id
}