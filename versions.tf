terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.4.0"
    }
  }
}
