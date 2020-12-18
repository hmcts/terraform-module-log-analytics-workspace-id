output "name" {
  value = local.resolved_name
  description = "Name of the log analytics Workspace"
}
output "subscription_id" {
  value = local.resolved_subscription_id
  description = "Subscription id of log analytics Workspace "
}
output "workspace_id" {
  description = "log analytics Workspace id"
  value = "/subscriptions/${local.resolved_subscription_id}/resourcegroups/oms-automation/providers/microsoft.operationalinsights/workspaces/${local.resolved_name}"
}