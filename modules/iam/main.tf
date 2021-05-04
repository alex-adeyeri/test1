

resource "aws_iam_instance_profile" "default_instance_profile" {
  name = var.aws_iam_instance_profile

  role = join("", aws_iam_role.default_role.*.name)
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "default_role" {
  name               = var.role_name
  path               = "/"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
  POLICY
  # permissions_boundary = var.permissions_boundary_arn

  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]

}