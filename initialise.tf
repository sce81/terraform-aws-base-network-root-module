provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      env     = var.env_name
      project = var.project_name
    }
  }
}

terraform {

  required_version = "~> 1.3.0"

  required_providers {
    aws = {
      version = "4.62.0"
      source  = "hashicorp/aws"
    }
  }
}