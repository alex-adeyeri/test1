variable "region" {
  description = "Region to deploy the resources to"
  type        = string
  default     = "us-east-1"
}

variable "instance_count" {
  description = "Set number of instances to create"
  default     = 1
}

variable "ami" {
  description = "(Required) AMI to use for the instance"
  default     = "ami-0742b4e673072066f" # Amazon linux ami in us-east-1
}

variable "vpc_security_group_ids" {
  description = " (Optional, VPC only) A list of security group IDs to associate with"
  type        = list(string)
  default     = ["sg-2ac45f0a"]
}
variable "subnet_id" {
  description = "x"
  default     = "subnet-0c55ac6a"
}
variable "role_name" {
  description = "x"
  default     = "sample_role1"
}
variable "aws_iam_instance_profile" {
  description = "x"
  default     = "instance_prof_sample1"
}
# variable "region" {
#   description = "Region to deploy the resources to"
#   type        = string
#   default     = "us-east-1"
# }

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

variable "alias_name" {
  description = "The display name of the alias."
  type        = string
  default     = "tf-test-ebs-key-dev"
}

variable "vpc_id" {
  description = "(Optional, Forces new resource) VPC ID"
  type        = string
}
variable "name" {
  description = "(Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string

}
variable "ebs_block_device" {
  description = " (Optional) One or more configuration blocks with additional EBS block devices to attach to the instance"
  default     = []
  type        = list(map(string))
}
variable "kms_key_id" {
  description = "(Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume"
  type        = string

}