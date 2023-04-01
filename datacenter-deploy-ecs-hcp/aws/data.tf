data "hcp_consul_cluster" "example" {
  cluster_id = var.hcp_cluster_id
}

data "hcp_hvn" "server" {
  hvn_id = "${var.name}-main-hvn"
}

data "aws_caller_identity" "this" {}

data "aws_caller_identity" "current" {}