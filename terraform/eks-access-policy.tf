resource "aws_eks_access_policy_association" "policy" {
  cluster_name  = aws_eks_cluster.fiap.name
  policy_arn    = var.policyArn
  principal_arn = var.principalArn

  access_scope {
    type = "cluster"
  }
}

data "aws_iam_policy" "secrets_manager_policy" {
  name = "EKSSecretsManagerPolicy"
  arn    = var.policyArn
}

resource "aws_eks_access_policy_association" "secrets_policy" {
  cluster_name  = aws_eks_cluster.fiap.name
  policy_arn    = data.aws_iam_policy.secrets_manager_policy.arn  # Referencia a policy existente
  principal_arn = var.principalArn  # Essa variável deve apontar para a ARN da role do EKS

  access_scope {
    type = "cluster"
  }
}