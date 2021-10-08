module "prometheus-stack" {
  source = "./modules/ec2-server"

  create = true
  region = "us-east-2"
  stage  = "prod"

  public_ip     = false

  user_data     = file("${path.module}/scripts/bootstrap.sh")
  iam_profile   = "<iam-profile>"
  vpc           = "vpc-02bac111540335910" # "<your-vpc-id>"

  subnets = ["subnet-0611b1934a17f0b0b"] # "<your-subnet>"

  ingress = [
    {
      description      = "allow_grafana"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow_prometheus"
      from_port        = 9000
      to_port          = 9000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    "Name"        = "monitoring-stack"
  }
}