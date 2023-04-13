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
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name = "aws_workspace_platform-dev"
    }
  }
  required_version = "~> 1.4.0"

  required_providers {
    aws = {
      version = "4.62.0"
      source  = "hashicorp/aws"
    }
  }
}