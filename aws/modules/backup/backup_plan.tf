#---------------------------------------------------
# AWS Backup plan
#---------------------------------------------------
resource "aws_backup_plan" "backup_plan" {
  count = var.enable_backup_plan ? 1 : 0

  name = var.backup_plan_name != "" ? lower(var.backup_plan_name) : "${lower(var.name)}-backup-plan-${lower(var.environment)}"

  dynamic "rule" {
    iterator = rule
    for_each = var.backup_plan_rule

    content {
      rule_name         = lookup(rule.value, "rule_name", null)
      target_vault_name = lookup(rule.value, "target_vault_name", element(concat(aws_backup_vault.backup_vault.*.name, [""]), 0))

      schedule            = lookup(rule.value, "schedule", null)
      start_window        = lookup(rule.value, "start_window", null)
      completion_window   = lookup(rule.value, "completion_window", null)
      recovery_point_tags = lookup(rule.value, "recovery_point_tags", null)

      dynamic "lifecycle" {
        iterator = lifecycle
        for_each = length(keys(lookup(rule.value, "lifecycle", {}))) > 0 ? [lookup(rule.value, "lifecycle", {})] : []

        content {
          cold_storage_after = lookup(lifecycle.value, "cold_storage_after", null)
          delete_after       = lookup(lifecycle.value, "delete_after", null)
        }
      }

      dynamic "copy_action" {
        iterator = copy_action
        for_each = length(keys(lookup(rule.value, "copy_action", {}))) > 0 ? [lookup(rule.value, "copy_action", {})] : []

        content {
          destination_vault_arn = lookup(copy_action.value, "destination_vault_arn", null)

          dynamic "lifecycle" {
            iterator = lifecycle
            for_each = length(keys(lookup(copy_action.value, "lifecycle", {}))) > 0 ? [lookup(copy_action.value, "lifecycle", {})] : []

            content {
              cold_storage_after = lookup(lifecycle.value, "cold_storage_after", null)
              delete_after       = lookup(lifecycle.value, "delete_after", null)
            }
          }
        }
      }

    }
  }

  tags = merge(
    {
      Name = var.backup_plan_name != "" ? lower(var.backup_plan_name) : "${lower(var.name)}-backup-plan-${lower(var.environment)}"
    },
    var.tags,
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_backup_vault.backup_vault
  ]
}
