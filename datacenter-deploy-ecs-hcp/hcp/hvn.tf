resource "hcp_hvn" "server" {
  hvn_id         = "${var.name}-main-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = "172.25.16.0/20"
}