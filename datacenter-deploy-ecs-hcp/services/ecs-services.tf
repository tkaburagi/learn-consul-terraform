# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# The client app is part of the service mesh. It calls
# the server app through the service mesh.
# It's exposed via a load balancer.
resource "aws_ecs_service" "example_client_app" {
  name            = "${var.name}-example-client-app"
  cluster         = data.aws_ecs_cluster.example.arn
  task_definition = module.example_client_app.task_definition_arn
  desired_count   = 1
  network_configuration {
    subnets = data.aws_subnet_ids.private.ids
  }
  launch_type    = "FARGATE"
  propagate_tags = "TASK_DEFINITION"
  load_balancer {
    target_group_arn = data.aws_lb_target_group.example.arn
    container_name   = "example-client-app"
    container_port   = 9090
  }
  enable_execute_command = true
}

# The server app is part of the service mesh. It's called
# by the client app.
resource "aws_ecs_service" "example_server_app" {
  name            = "${var.name}-example-server-app"
  cluster         = data.aws_ecs_cluster.example.arn
  task_definition = module.example_server_app.task_definition_arn
  desired_count   = 1
  network_configuration {
    subnets = data.aws_subnet_ids.private.ids
  }
  launch_type            = "FARGATE"
  propagate_tags         = "TASK_DEFINITION"
  enable_execute_command = true
}