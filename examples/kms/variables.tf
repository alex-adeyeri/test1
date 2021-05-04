variable "region" {
  description = "Region to deploy the resources to"
  type        = string
  default     = "us-east-1"
}
 
variable "description" {
  description = "The description of the key as viewed in AWS console"
  type        = string
  default     = "KMS key used to encrypt EBS Volume"
}
 
variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled. Defaults to false."
  type        = bool
  default     = true
}
 
variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30."
  type        = number
  default     = 7
}
 
variable "kms_alias_name" {
  description = "The display name of the alias."
  type        = string
  default     = "tf-test-ebs-key-dev"
}