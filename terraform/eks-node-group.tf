resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.fiap.name
  node_group_name = var.nodeName
  node_role_arn   = var.labRole
  subnet_ids      = [var.subnetA, var.subnetB, var.subnetC]
  disk_size       = 50
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}