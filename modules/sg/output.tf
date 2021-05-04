output "id" {
  description = "ID on the AWS Security Group associated with the instance."
  value       = [join("", aws_security_group.default.*.id)]
}
output "arn" {
  description = "ARN of the security group"
  value       = aws_security_group.default.*.arn
}
output "name" {
  description = "The name of the Security Group"
  value       = aws_security_group.default.*.name
}

output "owner_id" {
  description = "The owner ID of the Security Group"
  value       = aws_security_group.default.*.owner_id
}
output "tags_all" {
  description = "A map of tags assigned to the resource"
  value       = aws_security_group.default.*.tags_all
}