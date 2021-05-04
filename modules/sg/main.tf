resource "aws_security_group" "default" {
  count                  = var.sg_count
  description            = var.description
  name                   = var.name
  revoke_rules_on_delete = var.revoke_rules_on_delete
  tags                   = var.tags
  vpc_id                 = var.vpc_id

  dynamic "egress" {
    for_each = var.egress
    content {
      from_port        = lookup(egress.value, "from_port", null) # required when egress is being defined
      to_port          = lookup(egress.value, "to_port", null)   # required when egress is being defined
      cidr_blocks      = lookup(egress.value, "cidr_blocks", null)
      description      = lookup(egress.value, "description", null)
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(egress.value, "prefix_list_ids", null)
      protocol         = lookup(egress.value, "protocol", null)
      security_groups  = lookup(egress.value, "security_groups", null)
      self             = lookup(egress.value, "self", null)
    }
  }

  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port        = lookup(ingress.value, "from_port", null) # required when ingress is being defined
      to_port          = lookup(ingress.value, "to_port", null)   # required when ingress is being defined
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      description      = lookup(ingress.value, "description", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(ingress.value, "prefix_list_ids", null)
      protocol         = lookup(ingress.value, "protocol", null)
      security_groups  = lookup(ingress.value, "security_groups", null)
      self             = lookup(ingress.value, "self", null)
    }
  }

}