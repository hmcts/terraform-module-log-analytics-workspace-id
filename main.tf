/**
 * # https://github.com/hmcts/terraform-module-log-analytics-workspace-id
 *
 * # This module is used to output log analytics workpsace name based on the environment.
 *
 *
 */


locals {
  log_analytics_env_mapping = {
    sandbox = ["idam-saat", "idam-vault-saat", "idam-sandbox", "idam-vault-sandbox", "sandbox", "sbox", "sbox-int","ptlsbox"]
    nonprod = ["dev", "idam-preview", "idam-vault-preview", "preview", "test", "idam-ithc", "idam-vault-ithc", "ithc", "idam-demo", "idam-vault-demo", "demo", "stg", "idam-aat", "idam-vault-aat", "idam-aat2", "idam-vault-aat2", "aat", "idam-perftest", "idam-vault-perftest","perftest", "nonprodi"]
    prod    = ["idam-prod", "idam-prod2", "idam-vault-prod", "idam-vault-prod2", "prod", "mgmt", "ldata", "prod-int", "ptl"]
  }

  log_analytics_workspace = {
    sandbox = {
      subscription_id = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
      name            = "hmcts-sandbox"
    }
    nonprod = {
      subscription_id = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
      name            = "hmcts-nonprod"
    }
    prod = {
      subscription_id = "8999dec3-0104-4a27-94ee-6588559729d1"
      name            = "hmcts-prod"
    }
  }
  resolved_subscription_id = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.environment)][0]].subscription_id
  resolved_name            = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.environment)][0]].name
}

