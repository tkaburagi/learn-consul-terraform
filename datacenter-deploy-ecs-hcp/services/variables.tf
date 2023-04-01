variable "name" {
  description = "Name to be used on all the resources as identifier."
  type        = string
}

variable "default_tags" {
  description = "Default Tags for AWS"
  type        = map(string)
  default = {
    Environment = "dev"
    Team        = "Education-Consul"
    tutorial    = "Serverless Consul service mesh with ECS and HCP"
  }
}

variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-east-2"
}

variable "hcp_cluster_id" {
  type = string
}