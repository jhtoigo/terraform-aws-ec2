resource "aws_ebs_volume" "this" {
  for_each = { for idx, vol in var.ebs_volumes : idx => vol }

  availability_zone = aws_instance.instance.availability_zone
  size              = each.value.size
  type              = each.value.type
  tags = merge(
    var.resource_tags,
    {
      Name       = "${var.instance_name} - ${each.value.mountpoint}"
      Device     = "${each.value.device_name}"
      Mountpoint = "${each.value.mountpoint}"
    }
  )
}

resource "aws_volume_attachment" "this" {
  for_each = {
    for idx, vol in var.ebs_volumes :
    idx => {
      volume_id   = aws_ebs_volume.this[idx].id
      device_name = vol.device_name
    }
  }

  device_name = each.value.device_name
  volume_id   = each.value.volume_id
  instance_id = aws_instance.instance.id
}