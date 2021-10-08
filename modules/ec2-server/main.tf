resource "aws_instance" "server" {
  count                       = var.create ? 1 : 0
  ami                         = data.aws_ami.amazon-linux.id
  associate_public_ip_address = var.public_ip
  iam_instance_profile        = var.iam_profile
  instance_type               = lookup(local.instance_type, "${var.stage}")
  user_data                   = var.user_data
  vpc_security_group_ids      = [aws_security_group.allow_stack.id]
  subnet_id                   = join(",", var.subnets) # caso tenha mais de uma subnet, ele transforma em string

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

## desafio = cria ec2 prometheus, grafana > caracteristicas e atributos diferentes
# 01 - ABORDAGEM = usando uma list() com for_each = toset(list)

# 02 - ABORDAGEM = var. yuri = list(object) com for_each = { for yuri in var.yuri : yuri.name => yuri }

# 03 - ABORDAGEM = var. yuri = list(object) com for_each = { for yuri in var.yuri : yuri.name => yuri }

# teste = [estevao, yuri ]
# tipo = list
# for_each toset(list)
# aws_instance.this[estevao]
# aws_instance.this[yuri]
# ---
# yuri = [
#   {
#   	name = grafana
#   },
#   {
#     name= prometheus
#   }
# ]
# tipo = list(object)
# for_each = { for yuri in var.yuri : yuri.name => yuri }
# aws_instance.this[grafana]
# aws_instance.this[prometheus]
# ---
# reformadores = {
#      calvino = {
#  		careca = true
#      }
#   }
# tipo = map(object)
# for_each = { for name, attributes in var.whitelabel_attributes : name => attributes }
# aws_instance.this[reformadores]
