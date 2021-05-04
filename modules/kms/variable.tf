variable "kms_key_count" {
  description = "Number of kms key and alias to create"
  default     = 1
}

variable "description" {
  description = "The description of the key as viewed in AWS console."
  default     = null
  type        = string
}

variable "key_usage" {
  description = "Specifies the intended use of the key. Valid defaults: ENCRYPT_DECRYPT or SIGN_VERIFY. Defaults to ENCRYPT_DECRYPT"
  default     = null
  type        = string
}

variable "customer_master_key_spec" {
  description = "(Optional) Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid defaults: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT"
  default     = null
  type        = string
}

variable "policy" {
  description = "A valid policy JSON document"
  default     = null
  type        = string
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
  default     = null
  type        = string
}

variable "is_enabled" {
  description = "Specifies whether the key is enabled. Defaults to true."
  default     = null
  type        = bool
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled. Defaults to false."
  default     = null
  type        = bool
}

variable "tags" {
  description = "A map of tags to assign to the object."
  default     = null
  type        = map(string)
}

variable "alias_name" {
  description = "The display name of the alias. The name must start with the word 'alias' followed by a forward slash (alias/)"
  default     = null
}

variable "target_key_id" {
  description = "(Required) Identifier for the key for which the alias is for, can be either an ARN or key_id."
  default     = "mydefaultkmskey"
}