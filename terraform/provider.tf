provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)

  depends_on = [aws_eks_cluster.fiap]
}

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.fiap.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.fiap.name
}