resource "aws_iam_instance_profile" "profile_ssm_ec2" {
  name_prefix = "${var.instance_name}-"
  role        = aws_iam_role.role_ssm_ec2.name
  tags = merge(
    var.resource_tags
  )
}

resource "aws_iam_role" "role_ssm_ec2" {
  name_prefix = "${var.instance_name}-"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
  tags = merge(
    var.resource_tags
  )
}

resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.role_ssm_ec2.name
}

resource "aws_iam_role_policy_attachment" "aditional_iam_policies" {
  count      = var.aditional_iam_policies != null ? length(var.aditional_iam_policies) : 0
  policy_arn = var.aditional_iam_policies[count.index]
  role       = aws_iam_role.role_ssm_ec2.name
}
