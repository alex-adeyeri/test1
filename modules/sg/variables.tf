
variable "description" {
  description = "(Optional, Forces new resource) Security group description"
  type        = string
  default     = "Security Group managed by Terraform"
}
variable "name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix"
  type        = bool
  default     = true
}
variable "name" {
  description = "(Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string

}
variable "revoke_rules_on_delete" {
  description = "(Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself"
  type        = bool
  default     = false

}
variable "tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "sg_count" {
  default     = 1
  description = "Number of security groups to create"
}

variable "vpc_id" {
  description = "(Optional, Forces new resource) VPC ID"
  type        = string
}


variable "ingress" {
  default     = []
  description = "Configuration block for ingress rules"
  type        = list(map(string))
}

variable "egress" {
  default     = []
  description = "Configuration block for egress rules"
  type        = list(map(string))
}       