# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "client_lb_address" {
  value = "http://${aws_lb.example_client_app.dns_name}:9090/ui"
}