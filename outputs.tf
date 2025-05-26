##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "sqs_queues" {
  value = {
    for k, v in aws_sqs_queue.this : k => {
      name = v.name
      arn  = v.arn
      url  = v.id
    }
  }
}

output "sqs_queues_kms_key_id" {
  value = try(var.configs.encryption.enabled, false) ? aws_kms_key.this[0].id : null
}

output "sqs_queues_kms_key_arn" {
  value = try(var.configs.encryption.enabled, false) ? aws_kms_key.this[0].arn : null
}

output "sqs_queues_kms_key_alias" {
  value = try(var.configs.encryption.enabled, false) ? aws_kms_alias.this[0].name : null
}