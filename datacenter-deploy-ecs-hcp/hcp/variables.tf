variable "name" {
  description = "Name to be used on all the resources as identifier."
  type        = string
}

variable "hcp_datacenter_name" {
  type        = string
  description = "The name of datacenter the Consul cluster belongs to"
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
