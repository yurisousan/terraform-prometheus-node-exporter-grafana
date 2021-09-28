module "prometheus-stack" {
  source        = "./modules/ec2-server"
  
  create_server = true
  
  public_ip     = true
  instance_type = "t3.medium"
  user_data     = file("${path.module}/scripts/bootstrap.sh")
  iam_profile   = "<iam-profile>"
  vpc           = "<your-vpc-id>"

  subnets = "<your-subnet>"
    
  tags = {
    "Name"        = "monitoring-stack"
    "environment" = "<your-env>"
  }
}