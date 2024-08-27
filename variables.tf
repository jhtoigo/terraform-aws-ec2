variable "key_pair" {
  type        = string
  description = "Key Pair Name"
}

variable "subnet_id" {
  description = "ID from Subnet"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "availability_zone" {
  type        = string
  description = "AZ in which all the resources will be deployed"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
}

variable "instance_name" {
  type        = string
  description = "Instance Name"
}

variable "ami_instance" {
  type        = string
  description = "AMI for EC2"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance type"
}
variable "private_ip" {
  description = "EC2 Fixed IP"
  type        = string
  default     = null
}

variable "root_device_size" {
  description = "EC2 root disk Size"
  type        = number
  default     = null
}

variable "root_device_type" {
  description = "EC2 root disk type"
  type        = string
  default     = null
}

variable "ebs_block_devices" {
  description = "List of block devices"
  type        = list(any)
  default     = []
}

variable "ebs_volumes" {
  description = "List of EBS volumes to create and attach"
  type = list(object({
    size        = number
    device_name = string
    type        = string
    mountpoint  = string
  }))
  default = []
}

variable "public_ip" {
  type        = bool
  description = "Public IP"
  default     = null
}

variable "security_groups" {
  description = "Security Groups"
  type        = list(any)
  default     = []
}

variable "aditional_iam_policies" {
  description = "Set additional ARN policies for the EC2 Instance"
  type        = list(any)
  default     = []
}
variable "ebs_encrypted" {
  description = "EBS Encrypt true or false"
  type        = bool
  default     = true
}