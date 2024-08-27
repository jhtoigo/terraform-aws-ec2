resource "aws_instance" "instance" {
  ami                         = var.ami_instance
  instance_type               = var.instance_type
  key_name                    = var.key_pair
  availability_zone           = var.availability_zone
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = var.public_ip
  private_ip                  = var.private_ip
  iam_instance_profile        = aws_iam_instance_profile.profile_ssm_ec2.name
  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted             = var.ebs_encrypted
    delete_on_termination = false
    volume_type           = var.root_device_type
    volume_size           = var.root_device_size
    tags = merge(
      var.resource_tags,
      {
        Name = "${var.instance_name}-root-block"
      }
    )
  }

  tags = merge(
    var.resource_tags,
    {
      Name = var.instance_name
    }

  )
}