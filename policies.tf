##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

data "aws_iam_policy_document" "sqs_policy" {
  for_each = {
    for key, config in try(var.configs.queues, {}) : key => config
    if length(try(config.policies.sqs, {})) > 0
  }
  statement {
    sid     = try(var.configs.policies.sqs.sid, null)
    actions = var.configs.policies.sqs.actions
    effect  = var.configs.policies.sqs.effect
    dynamic "principals" {
      for_each = var.configs.policies.sqs.principals
      content {
        type        = principals.value.type
        identifiers = principals.value.identifiers
      }
    }
    resources = [
      aws_sqs_queue.this[each.key].arn
    ]
    dynamic "condition" {
      for_each = var.configs.policies.sqs.conditions
      content {
        variable = condition.value.variable
        test     = condition.value.test
        values   = condition.value.values
      }
    }
  }
}

resource "aws_sqs_queue_policy" "this" {
  for_each = {
    for key, config in try(var.configs.queues, {}) : key => config
    if length(try(config.policies.sqs, {})) > 0
  }
  queue_url = aws_sqs_queue.this[each.key].id
  policy    = data.aws_iam_policy_document.sqs_policy[each.key].json
}

resource "aws_sqs_queue_redrive_allow_policy" "this" {
  for_each = {
    for key, config in try(var.configs.queues, {}) : key => config
    if length(try(config.policies.redrive_allow, {})) > 0
  }
  queue_url            = aws_sqs_queue.this[each.key].id
  redrive_allow_policy = jsonencode(each.value.policies.redrive_allow)
}

resource "aws_sqs_queue_redrive_policy" "this" {
  for_each = {
    for key, config in try(var.configs.queues, {}) : key => config
    if length(try(config.policies.redrive, {})) > 0
  }
  queue_url      = aws_sqs_queue.this[each.key].id
  redrive_policy = jsonencode(each.value.policies.redrive)
}
