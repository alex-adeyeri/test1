terraform {
  required_version = ">=0.14.0"
  backend "s3" {
    region  = "us-east-1"
    profile = "default"
    key     = "kms-example/terraform.tfstate"
    bucket  = "xxxxxxxxxxxxxx"
  }
}
 
provider "aws" {
  region = var.region
}
 
module "kms" {
  source = "../../modules/kms/"
 
  description         = var.description
  enable_key_rotation = var.enable_key_rotation
  kms_alias_name      = var.kms_alias_name
  deletion_window_in_days = var.deletion_window_in_days
}