# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "consul_ui_address" {
  value = data.hcp_consul_cluster.example.consul_public_endpoint_url
}

output "subnets" {
  value = module.vpc.private_subnets
}