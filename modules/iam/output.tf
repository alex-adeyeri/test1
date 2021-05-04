output "default_instance_profile_name" {
  value = join("", aws_iam_instance_profile.default_instance_profile.*.name)
}
output "id" {
  value = aws_iam_instance_profile.default_instance_profile.id
}

output "arn" {
  value = aws_iam_instance_profile.default_instance_profile.arn
}
output "role" {
  value = aws_iam_instance_profile.default_instance_profile.role
}