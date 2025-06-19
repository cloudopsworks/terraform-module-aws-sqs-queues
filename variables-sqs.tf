##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# Configuration for SQS queues, Yaml format
# configs:
#   encryption:                           # (optional) KMS encryption configuration
#     enabled: true | false               # (optional) Enable KMS encryption, defaults to false
#     description: string                 # (optional) KMS key description
#     deletion_window_in_days: number     # (optional) KMS key deletion window, defaults to 7 days
#     enable_key_rotation: true | false   # (optional) Enable KMS key rotation, defaults to true
#     is_enabled: bool                    # (optional) Is KMS key enabled, defaults to true
#     alias: string                       # (optional) KMS key alias, defaults to "alias/(system_name)-sqs-queue"
#   queues:                       # Map of queue configurations
#     [queue_name]:
#       name: string                     # Queue name (optional)
#       name_prefix: string              # Queue name prefix if name not provided
#       fifo:
#         enabled: true | false          # (optional) Enable FIFO queue, defaults to false
#         throughput_limit: string       # (optional) FIFO throughput limit, can be "per_message_group_id" or "per_queue"
#       max_message_size: number         # (optional) Maximum message size, defaults to 262144 bytes (256 KB)
#       deduplication: true | false      # (optional) Content-based deduplication, defaults to false
#       visibility_timeout: number       # (optional) Visibility timeout in seconds
#       message_retention: number        # (optional) Message retention period in seconds
#       delay_seconds: number            # (optional) Message delay in seconds
#       receive_wait_time: number        # (optional) Long polling wait time
#       encryption:              # (optional) Encryption configuration for the queue
#         override: true | false        # (optional) Override encryption settings, when true, it ignores configs.encryption
#         sse_enabled: true | false     # (optional) Enable server-side encryption ignored if KMS is enabled in configs.encryption or kms_key_id is provided
#         kms_key_id: string            # (optional) KMS key ID for encryption, use to override configs.encryption
#         reuse_period_seconds: number  # (optional) KMS data key reuse period
#       policies:                # (optional) List of policies for the queue
#         sqs:                        # (optional) SQS queue policy
#           sid: string                 # Statement ID
#           actions: list(string)       # IAM actions
#           effect: string              # Allow/Deny
#           principals: list(object)     # IAM principals
#           conditions: list(object)     # Policy conditions
#         redrive_allow: map            # Dead letter queue allow policy
#         redrive: map                  # Dead letter queue policy
#
variable "configs" {
  description = "A map of configuration sets and their SQS destinations"
  type        = any
  default     = {}
}