terraform {

  // backend "s3" {
  //   bucket = "482485466615-terraform-state"
  //   key    = "base_network/terraform.tfstate"
  // }
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"
    workspaces {
      tags = ["base_infra"]
    }
    //  workspaces { name = "aws_workspace_base_infra_dev" }
  }
  required_providers {
    aws = {
      version = "~> 5.5.0"
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "eu-west-1"
  //    assume_role {
  //      role_arn    = var.role_arn
  //      external_id = "terraform_runner"
  //    }
  default_tags {
    tags = {
      env     = var.env_name
      project = var.project_name
    }
  }
}

