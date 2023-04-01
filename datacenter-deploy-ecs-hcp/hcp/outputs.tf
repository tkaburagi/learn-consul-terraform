# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "consul_root_token" {
  value = hcp_consul_cluster.example.consul_root_token_secret_id
  sensitive = true
}