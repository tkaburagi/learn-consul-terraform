data "hcp_consul_cluster" "example" {
  cluster_id = var.hcp_cluster_id
}

data "aws_ecs_cluster" "example" {
  cluster_name = var.name
}

data "aws_secretsmanager_secret" "bootstrap_token" {
  name = "${var.name}-bootstrap-token"
}

data "aws_secretsmanager_secret" "gossip_key" {
  name = "${var.name}-gossip-key"
}

data "aws_secretsmanager_secret" "consul_ca_cert" {
  name = "${var.name}-consul-ca-cert"
}

data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_lb_target_group" "example" {
  name = "${var.name}-example-client-app"
}

data "aws_lb" "example" {
  name = "${var.name}-example-client-app"
}

data "aws_vpc" "example" {
  tags = {
    Name = var.name
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.example.id
  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}