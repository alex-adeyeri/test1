# resource "aws_instance" "default" {
#   count = var.instance_count

#   ami = var.ami

#   instance_type               = var.instance_type
#   associate_public_ip_address = var.associate_public_ip_address

#   availability_zone = var.availability_zone

#   cpu_core_count = var.cpu_core_count

#   cpu_threads_per_core = var.cpu_threads_per_core

#   credit_specification {
#     cpu_credits = var.cpu_credits
#   }

#   disable_api_termination = var.disable_api_termination

#   ebs_optimized = var.ebs_optimized


#   #   dynamic "enclave_options" {
#   #       for_each = var.enclave_options
#   #       content {
#   #           enclave_options = lookup(enclave_options.value, "enclave_options", null) 
#   #       }
#   #   }                    


#   dynamic "ephemeral_block_device" {
#     for_each = var.ephemeral_block_device
#     content {
#       device_name  = ephemeral_block_device.value.device_name
#       no_device    = lookup(ephemeral_block_device.value, "no_device", null)
#       virtual_name = lookup(ephemeral_block_device.value, "virtual_name", null)
#     }
#   }

#   get_password_data = var.get_password_data


#   hibernation = var.hibernation

#   host_id                              = var.host_id
#   iam_instance_profile                 = var.iam_instance_profile
#   instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
#   ipv6_address_count                   = var.ipv6_address_count
#   ipv6_addresses                       = var.ipv6_addresses
#   key_name                             = var.key_name
#   monitoring                           = var.monitoring

#   dynamic "network_interface" {
#     for_each = var.network_interface
#     content {
#       delete_on_termination = lookup(network_interface.value, "delete_on_termination", false) # only valid value for delete_on_termination is false
#       device_index          = network_interface.value.device_index                            # required if network interface list is not empty
#       network_interface_id  = lookup(network_interface.value, "network_interface_id", null)
#     }
#   }
#   placement_group = var.placement_group
#   private_ip      = var.private_ip

#   dynamic "root_block_device" {
#     for_each = var.root_block_device
#     content {
#       delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
#       encrypted             = lookup(root_block_device.value, "encrypted", null)
#       iops                  = lookup(root_block_device.value, "iops", null)
#       kms_key_id            = root_block_device.value.kms_key_id # Enforce kmsid
#       throughput            = lookup(root_block_device.value, "throughput", null)
#       # tags will be specified in volume tags
#       volume_size = lookup(root_block_device.value, "volume_size", null)
#       volume_type = lookup(root_block_device.value, "volume_type", null)
#     }
#   }
#   secondary_private_ips  = var.secondary_private_ips
#   security_groups        = var.security_groups
#   source_dest_check      = var.source_dest_check
#   subnet_id              = var.subnet_id
#   tags                   = var.tags
#   tenancy                = var.tenancy
#   user_data              = var.user_data
#   user_data_base64       = var.user_data_base64
#   volume_tags            = var.volume_tags
#   vpc_security_group_ids = var.vpc_security_group_ids

# }


# #? To Do: Create tenary operation for AMI to use data or variable
# #? Create validation conditions 
# #?    using userdata and userdatabase64 (only one should be specified)
# #?    using security_groups and security_group_ids (only one should be specified)
# #? Enforce kms 
# #? Enforce metadata options for security v2
# #? Look into enclave options error
# #? Add ebs volume, root block device
# #? Work on tags