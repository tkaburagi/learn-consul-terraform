# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
data "aws_security_group" "vpc_default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group" "example_client_app_alb" {
  name   = "${var.name}-example-client-app-alb"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "Access to example client application."
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ingress_from_client_alb_to_ecs" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.example_client_app_alb.id
  security_group_id        = data.aws_security_group.vpc_default.id
}