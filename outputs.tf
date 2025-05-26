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
      arn = v.arn
      url = v.id
    }
  }
}
