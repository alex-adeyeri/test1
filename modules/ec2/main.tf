resource "aws_instance" "default" {
  count                                = var.instance_count
  ami                                  = var.ami
  instance_type                        = var.instance_type
  associate_public_ip_address          = var.associate_public_ip_address
  availability_zone                    = var.availability_zone
  cpu_core_count                       = var.cpu_core_count
  cpu_threads_per_core                 = var.cpu_threads_per_core
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized
  get_password_data                    = var.get_password_data
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  iam_instance_profile                 = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  ipv6_address_count                   = var.ipv6_address_count
  ipv6_addresses                       = var.ipv6_addresses
  key_name                             = var.key_name
  monitoring                           = var.monitoring
  placement_group                      = var.placement_group
  private_ip                           = var.private_ip
  secondary_private_ips                = var.secondary_private_ips
  source_dest_check                    = var.source_dest_check
  subnet_id                            = var.subnet_id
  tenancy                              = var.tenancy
  user_data                            = var.user_data
  vpc_security_group_ids               = var.vpc_security_group_ids

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = lookup(ephemeral_block_device.value, "no_device", null)
      virtual_name = lookup(ephemeral_block_device.value, "virtual_name", null)
    }
  }

  metadata_options {
    http_endpoint               = var.http_endpoint
    http_put_response_hop_limit = var.http_put_response_hop_limit
    http_tokens                 = var.http_tokens
  }

  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      delete_on_termination = lookup(network_interface.value, "delete_on_termination", false) # only valid value for delete_on_termination is false
      device_index          = network_interface.value.device_index                            # required if network interface list is not empty
      network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
    }
  }

  root_block_device {
    delete_on_termination = var.delete_on_termination
    encrypted             = true
    iops                  = var.iops
    kms_key_id            = var.kms_key_id == "" || var.kms_key_id == null ? data.aws_kms_key.by_alias.arn : var.kms_key_id
    throughput            = var.throughput
    volume_size           = var.volume_size
    volume_type           = var.volume_type
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device

    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name # device_name is required
      encrypted             = true
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = var.kms_key_id == "" || var.kms_key_id == null ? data.aws_kms_key.by_alias.arn : var.kms_key_id
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      throughput            = lookup(ebs_block_device.value, "throughput", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }

  tags = merge(
    {
      "Created_with" = "terraform"
    },
    var.tags
  )
  volume_tags = merge(
    {
      "Created_with" = "terraform"
    },
  var.volume_tags)
}


#! To Do: 
#! Create tenary operation for AMI to use data or variable (The user should handle this part)
#! Enforce kms
#! Set metadata options for security to v2 by default
#! Look into enclave options error (This module does not support enclave option because terraform14)
#! Add ebs volume (This is not adviced as terraform might recreate ec2 instances when change is made to the ebs volume)
#! Work on tags - tags for volumes will be specified in volume tags