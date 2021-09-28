resource "aws_instance" "server" {
  count                       = var.create_server ? 1 : 0
  ami                         = data.aws_ami.amazon-linux.id
  associate_public_ip_address = var.public_ip
  iam_instance_profile        = var.iam_profile
  instance_type               = var.instance_type
  user_data                   = var.user_data
  vpc_security_group_ids      = [aws_security_group.allow_stack.id]
  subnet_id                   = var.subnets
  ebs_block_device {
    delete_on_termination = var.delete_on_termination
    device_name           = var.ebs_name
    encrypted             = var.encrypted
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    tags                  = var.tags
  }
  depends_on = [
    aws_security_group.allow_stack
  ]
  tags = var.tags
}