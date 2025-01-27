terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"
      workspaces {
              project = "baseinfra"
              name = "aws_workspace_base_infra_import"
       }
  }
  required_providers {
    aws = {
      version = "~> 5.84.0"
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "eu-west-1"

//    assume_role_with_web_identity {
//      role_arn           = var.role_arn
//      web_identity_token = var.identity_token
//    }
  default_tags {
    tags = {
      env     = var.env_name
      project = var.project_name
    }
  }
}

