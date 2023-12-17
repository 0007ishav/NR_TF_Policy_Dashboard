# < --------------------->

resource "newrelic_alert_policy" "Laptop_policy" {
  name = var.policy_name
}

# <---------------------->

resource "newrelic_nrql_alert_condition" "Laptop_conditons" {
  count = length(var.metrics)
  account_id = var.account_id
  policy_id = newrelic_alert_policy.Laptop_policy.id
  type = var.type
  name = "Laptop_conditions-${var.metrics[count.index].name}"
  enabled = var.enabled

  nrql {
    query = var.metrics[count.index].query
  }

  critical {
    operator = var.operator_critical
    threshold = var.metrics[count.index].name == "CPU" ? var.threshold_critical_CPU : var.threshold_critical_Memory
    threshold_duration = var.threshold_duration_critical
    threshold_occurrences = var.threshold_occurences_critical
  }

  warning {
    operator = var.operator_warning
    threshold = var.metrics[count.index].name == "CPU" ? var.threshold_warning_CPU : var.threshold_warning_Memory
    threshold_duration = var.threshold_duration_warning
    threshold_occurrences = var.threshold_occurences_warning
  }
}