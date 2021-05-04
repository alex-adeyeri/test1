output "ec2_output" {
  value = module.ec2_instance
}
output "iam_output" {
  value = module.iam
}
output "sg_output" {
  value = module.sg
}
output "kms_output" {
  value = module.kms
}