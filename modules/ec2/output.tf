output "arn" {
  value = aws_instance.default.*.arn
}
output "instance_state" {
  value = aws_instance.default.*.instance_state
}
output "outpost_arn" {
  value = aws_instance.default.*.outpost_arn
}
output "password_data" {
  value = aws_instance.default.*.password_data
}
output "primary_network_interface_id" {
  value = aws_instance.default.*.primary_network_interface_id
}
output "private_dns" {
  value = aws_instance.default.*.private_dns
}
output "public_dns" {
  value = aws_instance.default.*.public_dns
}
output "public_ip" {
  value = aws_instance.default.*.public_ip
}
# output "volume_id" {
#   value = aws_instance.default.*.volume_id
# }
# output "device_name" {
#   value = aws_instance.default.*.device_name
# }