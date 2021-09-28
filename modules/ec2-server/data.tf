data "aws_ami" "amazon-linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_vpc" "main" {
  id = var.vpc
}