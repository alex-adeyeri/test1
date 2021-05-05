terraform {
  required_version = ">=0.14.0"
  backend "s3" {
    region  = "us-east-1"
    profile = "default"
    key     = "ec2-example/terraform.tfstate"
    bucket  = "atlantabucket24"
  }
}

provider "aws" {
  region = var.region
  /*
  NOTE: This functionality (default_tags) is in public preview and there are no compatibility promises 
  with future versions of the Terraform AWS Provider until a general availability announcement. 
  This functionality is only supported in the following resources: aws_subnet, aws_vpc
  */
  default_tags {
    tags = {
      Environment = "Development"
    }
  }
  # assume_role {
  #   role_arn = ""
  # }
}

module "ec2_instance" {
  source = "../../modules/ec2/"

  instance_count         = var.instance_count
  ami                    = var.ami
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  iam_instance_profile   = module.iam.id
  security_groups        = module.sg.id
  tags = {
    "Environment" = "Private"
  }

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10

    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 5
      kms_key_id  = module.kms.key_id


    }
  ]

}


module "iam" {
  source = "../../modules/iam/"


  aws_iam_instance_profile = var.aws_iam_instance_profile
  role_name                = var.role_name
}

module "sg" {
  source = "../../modules/sg/"

  name   = var.name
  vpc_id = var.vpc_id
  # ingress_cidr_blocks = ["10.0.0.0/16"]
  # ingress_rules       = ["https-443-tcp"]

  tags = {
    Value = "sg_example"

  }

}
module "kms" {
  source = "../../modules/kms/"

  description             = var.description
  enable_key_rotation     = var.enable_key_rotation
  alias_name              = var.alias_name
  deletion_window_in_days = var.deletion_window_in_days
}
