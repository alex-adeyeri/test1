data "aws_kms_key" "by_alias" {
  key_id = "alias/aws/ebs"
}