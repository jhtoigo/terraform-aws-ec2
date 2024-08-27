# Terraform AWS EC2 Module

Module to create EC2 instances

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_iam_instance_profile.profile_ssm_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role_ssm_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.aditional_iam_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm_managed_instance_core](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_volume_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aditional_iam_policies"></a> [aditional\_iam\_policies](#input\_aditional\_iam\_policies) | Set additional ARN policies for the EC2 Instance | `list(any)` | `[]` | no |
| <a name="input_ami_instance"></a> [ami\_instance](#input\_ami\_instance) | AMI for EC2 | `string` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ in which all the resources will be deployed | `string` | n/a | yes |
| <a name="input_ebs_block_devices"></a> [ebs\_block\_devices](#input\_ebs\_block\_devices) | List of block devices | `list(any)` | `[]` | no |
| <a name="input_ebs_volumes"></a> [ebs\_volumes](#input\_ebs\_volumes) | List of EBS volumes to create and attach | <pre>list(object({<br>    size        = number<br>    device_name = string<br>    type        = string<br>    mountpoint  = string<br>  }))</pre> | `[]` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Instance Name | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 Instance type | `string` | n/a | yes |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | Key Pair Name | `string` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | EC2 Fixed IP | `string` | `null` | no |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Public IP | `bool` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Tags to set for all resources | `map(string)` | n/a | yes |
| <a name="input_root_device_size"></a> [root\_device\_size](#input\_root\_device\_size) | EC2 root disk Size | `number` | `null` | no |
| <a name="input_root_device_type"></a> [root\_device\_type](#input\_root\_device\_type) | EC2 root disk type | `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Security Groups | `list(any)` | `[]` | no |
| <a name="input_sg_egress_rules"></a> [sg\_egress\_rules](#input\_sg\_egress\_rules) | Protcols list with egress permission | `list(any)` | n/a | yes |
| <a name="input_sg_ingress_networks"></a> [sg\_ingress\_networks](#input\_sg\_ingress\_networks) | Network list with ingress permission | `list(any)` | `[]` | no |
| <a name="input_sg_ingress_rules"></a> [sg\_ingress\_rules](#input\_sg\_ingress\_rules) | Protcols list with ingress permission | `list(any)` | `[]` | no |
| <a name="input_sg_ingress_with_cidr_blocks"></a> [sg\_ingress\_with\_cidr\_blocks](#input\_sg\_ingress\_with\_cidr\_blocks) | Configure CIDR blocks for ingress rules. | `list(any)` | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID from Subnet | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_availability_zone"></a> [ec2\_availability\_zone](#output\_ec2\_availability\_zone) | The availability zone of the created instance |
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | The ID of the instance |
| <a name="output_ec2_ip_address"></a> [ec2\_ip\_address](#output\_ec2\_ip\_address) | EC2 instance Private IP Address |
<!-- END_TF_DOCS -->