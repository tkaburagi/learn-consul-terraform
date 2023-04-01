terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">3.0.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.14.0"
    }
  }
}

provider "hcp" {}
provider "aws" {
  region = var.region
  default_tags {
    tags = var.default_tags
  }
}