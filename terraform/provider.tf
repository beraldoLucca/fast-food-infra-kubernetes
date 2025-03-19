provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
}

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.fiap.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.fiap.name
}

resource "null_resource" "configure_kubeconfig" {
  depends_on = [aws_eks_cluster.fiap]

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${aws_eks_cluster.fiap.name} --region us-east-1"
  }
}