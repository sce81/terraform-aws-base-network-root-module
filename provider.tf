terraform {
  required_version = "~> 1.5.0"
  // backend "s3" {
  //   bucket = "mybucket"
  //   key    = "path/to/my/key"
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
      hello = "world"
    }
  }
}

