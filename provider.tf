terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"
    workspaces {
      tags = ["base_infra"]
    }
  }
  required_providers {
    aws = {
      version = "~> 5.98.0"
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = var.region
  //  assume_role {
  //    role_arn    = var.role_arn
  //    external_id = "terraform_agent_dev"
  //  }
  default_tags {
    tags = {
      env     = var.env_name
      project = var.project_name
    }
  }
}

