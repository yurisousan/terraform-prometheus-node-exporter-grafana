variable "create" {
  description = ""
  type        = bool
  default     = false
}

variable "stage" {
  description = ""
  type        = string
}

variable "region" {
  description = ""
  type        = string
}

variable "public_ip" {
  description = ""
  type        = bool
  default = false
}

variable "vpc" {
  description = ""
  type        = string
  default     = null
}

variable "iam_profile" {
  description = ""
  type        = string
  default     = null
}

# variable "key_name" {
#   description = ""
#   type = string
#   default = null
# }

variable "security_group_ids" {
  description = ""
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = ""
  type        = list(string)
}

### EBS \/

variable "delete_on_termination" {
  description = ""
  type        = bool
  default     = true
}

variable "ebs_name" {
  type    = string
  default = "/dev/sdb"
}

variable "encrypted" {
  type    = bool
  default = true
}

variable "volume_size" {
  type    = number
  default = 30
}

variable "volume_type" {
  type    = string
  default = "gp3"
}

variable "user_data" {
  type    = string
  default = ""
}

variable "tags" {
  description = ""
  type = map(string)
  default = {}
}

## SECURITY GROUP
variable "ingress" {
  description = ""
  type = list
  default = [
    {
      description      = "Description"
      from_port        = null
      to_port          = null
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}

variable "egress" {
  description = ""
  type = list
  default = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow_all"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}