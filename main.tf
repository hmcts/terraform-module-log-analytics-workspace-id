/**
 * # https://github.com/hmcts/terraform-module-log-analytics-workspace-id
 *
 * # This module is used to output log analytics workpsace name based on the environment.
 *
 *
 */


locals {
  log_analytics_env_mapping = {
    sandbox = ["sbox"]
    nonprod = ["dev", "preview", "test", "ithc", "demo", "stg", "aat","perftest"]
    prod    = ["prod", "mgmt","ldata"]
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
    qa = {
      subscription_id = "7a4e3bd5-ae3a-4d0c-b441-2188fee3ff1c"
      name            = "hmcts-qa"
    }
    ldata = {
      subscription_id = "4da0ce99-35c5-491f-8a0b-56c39f7278fa"
      name            = "hmcts-ethosldata"
    }
    prod = {
      subscription_id = "8999dec3-0104-4a27-94ee-6588559729d1"
      name            = "hmcts-prod"
    }
  }
  resolved_subscription_id = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.environment)][0]].subscription_id
  resolved_name            = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.environment)][0]].name
}

