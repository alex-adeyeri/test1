resource "aws_kms_key" "default" {
  count                    = var.kms_key_count
  description              = var.description
  key_usage                = var.key_usage
  deletion_window_in_days  = var.deletion_window_in_days
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.enable_key_rotation
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = var.policy
  tags                     = var.tags
}

resource "aws_kms_alias" "default" {
   count         = var.kms_key_count
  name          = "alias/${var.kms_alias_name}"
  target_key_id = aws_kms_key.default.*.id[count.index]
}