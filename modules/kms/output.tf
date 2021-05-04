
output "kms_key_arn" {
  value       = aws_kms_key.default.*.arn
  description = "The Amazon Resource Name (ARN) of the key."
}

output "kms_key_id" {
  value       = aws_kms_key.default.*.key_id
  description = "The globally unique identifier for the key."
}

output "tags_all" {
  value       = aws_kms_key.default.*.tags_all
  description = "A map of tags assigned to the resource"
}

output "alias_arn" {
  value       = aws_kms_alias.default.*.arn
  description = "The Amazon Resource Name (ARN) of the key alias."
}

output "target_key_arn" {
  value       = aws_kms_alias.default.*.target_key_arn
  description = "The Amazon Resource Name (ARN) of the target key identifier."
}