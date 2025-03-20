resource "aws_eks_access_policy_association" "policy" {
  cluster_name  = aws_eks_cluster.fiap.name
  policy_arn    = var.policyArn
  principal_arn = var.principalArn

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_policy_association" "secrets_policy" {
  cluster_name  = aws_eks_cluster.fiap.name
  policy_arn    = aws_iam_policy.secrets_manager_policy.arn  # Aqui usamos a policy criada acima
  principal_arn = var.principalArn  # Essa variável deve apontar para a ARN da role do EKS

  access_scope {
    type = "cluster"
  }
}

resource "aws_iam_policy" "secrets_manager_policy" {
  name        = "EKSSecretsManagerPolicy"
  description = "Policy to allow EKS to access AWS Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["secretsmanager:GetSecretValue"]
      Resource = aws_secretsmanager_secret.aws_credentials.arn
    }]
  })
}