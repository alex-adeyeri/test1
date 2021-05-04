variable "instance_count" {
  description = "Set number of instances to create"
  default     = 1
}

variable "ami" {
  description = "(Required) AMI to use for the instance"
  default     = "ami-0742b4e673072066f" # Amazon linux ami in us-east-1
}

variable "associate_public_ip_address" {
  description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
  default     = null
  type        = bool
}

variable "availability_zone" {
  description = "(Optional) AZ to start the instance in"
  default     = null
}

variable "cpu_core_count" {
  description = "(Optional) Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API."
  default     = null
}

variable "cpu_threads_per_core" {
  description = " (Optional - has no effect unless cpu_core_count is also set) If set to to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set."
  default     = null
}

variable "cpu_credits" {
  description = "(Optional) Credit option for CPU usage. Valid values include standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default."
  default     = null
}
variable "delete_on_termination" {
  description = "(Optional) Whether the volume should be destroyed on instance termination"
  type = bool
  default = true
}

variable "disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection"
  default     = null
  type        = bool
}

variable "ebs_optimized" {
  description = "(Optional) One or more configuration blocks with additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation"
  default     = null
  type        = bool
}

variable "enclave_options" {
  description = "(Optional) Enable Nitro Enclaves on launched instances"
  default     = []
  type        = list(map(bool))
}


variable "ephemeral_block_device" {
  description = "(Optional) One or more configuration blocks to customize Ephemeral (also known as 'Instance Store') volumes on the instance"
  default     = []
  type        = list(map(string))
}

variable "get_password_data" {
  description = "(Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute."
  default     = null
  type        = bool
}

variable "hibernation" {
  description = "(Optional) If true, the launched EC2 instance will support hibernation."
  default     = null
  type        = bool
}

variable "host_id" {
  description = "(Optional) ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host."
  default     = null
}
variable "http_endpoint" {
  description = "(Optional) Whether the metadata service is available"
  default = "enabled"
}
variable "http_put_response_hop_limit" {
  description = "(Optional) Desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values are integer from 1 to 64"
  default = null
}
variable "http_tokens" {
  description = " (Optional) Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2)"
  default = null
}

variable "iam_instance_profile" {
  description = "(Optional) IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  default     = null
}
variable "instance_initiated_shutdown_behavior" {
  description = "Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances"
  default     = null
}
variable "instance_type" {
  description = "(Required) Type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance"
  default     = "t2.micro"
}
variable "iops" {
  description = "(Optional) Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3"
  default = null
  
}
variable "ipv6_address_count" {
  description = "(Optional) A number of IPv6 addresses to associate with the primary network interface"
  default     = null
}
variable "ipv6_addresses" {
  description = "(Optional) Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = null
}
variable "key_name" {
  description = "(Optional) Key name of the Key Pair to use for the instance"
  default     = null
}
variable "kms_key_id" {
  description = "(Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume"
  default = null
}
variable "metadata_options" {
  description = "(Optional) Customize the metadata options of the instance"
  default     = null
}
variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = null
}
variable "network_interface" {
  description = "(Optional) Customize network interfaces to be attached at instance boot time"
  default     = []
  type        = list(map(string))
}
variable "placement_group" {
  description = "(Optional) Placement Group to start the instance in"
  default     = null
}
variable "private_ip" {
  description = "(Optional) Private IP address to associate with the instance in a VPC"
  default     = null
}


variable "root_block_device" {
  description = "Optional) Configuration block to customize details about the root block device of the instance"
  default     = []
  type        = list(map(string))
}

variable "secondary_private_ips" {
  description = "(Optional) A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC"
  default     = null
}
variable "security_groups" {
  description = "(Optional, EC2-Classic and default VPC only) A list of security group names (EC2-Classic) or IDs (default VPC) to associate with"
  default     = null
  type        = list(string)

}
variable "source_dest_check" {
  description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance"
  default     = null
}
variable "subnet_id" {
  description = "(Optional) VPC Subnet ID to launch in"
  default     = null
}
variable "tags" {
  description = "(Optional) A map of tags to assign to the resource"
  default     = null
}
variable "tenancy" {
  description = "(Optional) Tenancy of the instance (if the instance is running in a VPC)"
  default     = null
}
variable "throughput" {
  description = "(Optional) Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3"
  default = null
}
variable "user_data" {
  description = "(Optional) User data to provide when launching the instance"
  default     = null
}
variable "user_data_base64" {
  description = "(Optional) Can be used to pass base64-encoded binary data directly"
  default     = null
}
variable "volume_tags" {
  description = "(Optional) A map of tags to assign, at instance-creation time, to root and EBS volumes"
  default     = null
}
variable "vpc_security_group_ids" {
  description = " (Optional, VPC only) A list of security group IDs to associate with"
  default     = null
  type        = list(string)
}
variable "volume_size" {
  description = "(Optional) Size of the volume in gibibytes (GiB)"
  default = null
}
variable "volume_type" {
  description = "(Optional) Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1"
  default = "gp2"
  
}
variable "ebs_block_device" {
  description = " (Optional) One or more configuration blocks with additional EBS block devices to attach to the instance"
  default     = []
  type        = list(map(string))
}