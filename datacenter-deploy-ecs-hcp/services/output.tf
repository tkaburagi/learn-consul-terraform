output "app_lb_address" {
  value = "http://${data.aws_lb.example.dns_name}:9090/ui"
}

output "ids" {
  value = data.aws_subnet_ids.private.ids
}