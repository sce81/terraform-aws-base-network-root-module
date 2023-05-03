# terraform-env-aws-network-layer
Terraform Cloud Network Layer for deploying base networks across multiple AWS environments. 


## Getting Started

This Root module expects terraform vars to be passed in via the parent module. 


```
module "AWS_Workspace_Base_Infra" {
  for_each                      = local.workspace_vars.base_infra_vars
  source                        = "app.terraform.io/HashiCorp_TFC_Automation_Demo/tfc-workspace-management/module"
  version                       = "2.0.7"
  name                          = "aws_workspace_base_infra-${each.key}"
  organization                  = data.tfe_organization.main.name
  vcs_repo                      = local.base_infra_repo
  tfe_variables                 = each.value
  project_id                    = tfe_project.base_infra.id
  structured_run_output_enabled = "true"
  workspace_tags                = [each.key, "aws", "base_infra", "platform"]

  depends_on = [
    tfe_project.base_infra
  ]
}
```


Terraform variables should be passed in via a map

```    
base_infra_vars = {
      "dev" = {
        "vpc_name" = {
          value       = "example"
          description = "vpc name identifier"
          category    = "terraform"
        },
        "env_name" = {
          value       = "dev"
          description = "env name for identifier"
          category    = "terraform"
        },
        "project_name" = {
          value       = "TFC example"
          description = "Project Name for tagging purposes"
          category    = "terraform"
        },
        "vpc_cidr" = {
          value       = "10.0.0.0/20"
          description = "vpc network cidr"
          category    = "terraform"
        },
        "public_subnet_cidr" = {
          value       = join(", ", ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "private_subnet_cidr" = {
          value       = join(", ", ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "database_subnet_cidr" = {
          value       = join(", ", ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "cross_account_role" = {
          value       = "example_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
      },
}

```