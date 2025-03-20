resource "aws_eks_cluster" "fiap" {
  name     = "fast-food-k8s-1"
  role_arn = var.labRole

  vpc_config {
    subnet_ids         = [var.subnetA, var.subnetB, var.subnetC]
    security_group_ids = [var.sgId]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}