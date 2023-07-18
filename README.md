# terraform-module-log-analytics-workspace-id

This module is used to output log analytics workpsace name based on the environment.

```hcl
module "log_analytics_workspace_id" {
  source = "git@github.com:hmcts/terraform-module-log-analytics-workspace-id?ref=master"

  environment = var.env
}

```

## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Enter name of the environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | Name of the log analytics Workspace |
| subscription\_id | Subscription id of log analytics Workspace |
| resource\_group\_name | Resource group of log analytics Workspace |
| workspace\_id | log analytics Workspace id |

