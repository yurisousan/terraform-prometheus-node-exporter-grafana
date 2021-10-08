# criado para constantes dentro do terraform
# ou seja, dados uqe nao vao variar

locals {
  instance_type = {
    "prod" = "t3.large"
    "hom"  = "t3.medium"
    "dev"  = "t3.micro"
  }
}