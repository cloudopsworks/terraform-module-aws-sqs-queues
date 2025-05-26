##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

resource "aws_sqs_queue" "this" {
  for_each                          = var.configs
  name                              = try(each.value.name, "") != "" ? each.value.name : format("%s-%s-queue", try(each.value.name_prefix, each.key), local.system_name)
  fifo_queue                        = try(each.value.fifo.enabled, null)
  max_message_size                  = try(each.value.max_message_size, null)
  fifo_throughput_limit             = try(each.value.fifo.throughput_limit, null)
  content_based_deduplication       = try(each.value.deduplication, null)
  visibility_timeout_seconds        = try(each.value.visibility_timeout, null)
  message_retention_seconds         = try(each.value.message_retention, null)
  delay_seconds                     = try(each.value.delay_seconds, null)
  receive_wait_time_seconds         = try(each.value.receive_wait_time, null)
  sqs_managed_sse_enabled           = try(each.value.encryption.sse_enabled, null)
  kms_master_key_id                 = try(each.value.encryption.kms_key_id, null)
  kms_data_key_reuse_period_seconds = try(each.value.encryption.reuse_period_seconds, null)
  tags                              = local.all_tags
}
