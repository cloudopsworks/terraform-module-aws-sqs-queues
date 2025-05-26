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
#   encryption:                           # KMS encryption configuration
#     enabled: bool                       # Enable KMS encryption
#     description: string                 # KMS key description
#     deletion_window_in_days: number     # KMS key deletion window
#     enable_key_rotation: bool           # Enable KMS key rotation
#     is_enabled: bool                    # Is KMS key enabled
#     alias: string                       # KMS key alias
#   queues:                              # Map of queue configurations
#     [queue_name]:
#       name: string                      # Queue name (optional)
#       name_prefix: string              # Queue name prefix if name not provided
#       fifo:
#         enabled: bool                   # Enable FIFO queue
#         throughput_limit: string        # FIFO throughput limit
#       max_message_size: number         # Maximum message size
#       deduplication: bool              # Content-based deduplication
#       visibility_timeout: number       # Visibility timeout in seconds
#       message_retention: number        # Message retention period in seconds
#       delay_seconds: number            # Message delay in seconds
#       receive_wait_time: number        # Long polling wait time
#       encryption:
#         sse_enabled: bool              # Enable server-side encryption ignored if KMS is enabled in configs.encryption
#         kms_key_id: string            # KMS key ID for encryption
#         reuse_period_seconds: number   # KMS data key reuse period
#       policies:
#         sqs:                          # SQS queue policy
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