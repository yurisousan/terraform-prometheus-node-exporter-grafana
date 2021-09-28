variable "create_server" { type = bool }

variable "public_ip" { type = bool }

variable "vpc" {}

variable "iam_profile" {}

variable "instance_type" {}

# variable "key_name" {}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "subnets" {}

variable "delete_on_termination" {
  type    = bool
  default = true
}

variable "ebs_name" {
  default = "/dev/sdb"
}

variable "encrypted" {
  type    = bool
  default = true
}

variable "volume_size" {
  default = 30
}

variable "volume_type" {
  default = "gp3"
}

variable "user_data" {}

variable "tags" {
  type    = map(any)
  default = {}
}