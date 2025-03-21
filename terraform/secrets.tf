resource "aws_secretsmanager_secret" "eks_service_url" {
  name        = "eks-service-url-9"
  depends_on = [data.kubernetes_service.fast_food_service]
  description = "Secret containing the URL of the EKS service load balancer"
}

resource "aws_secretsmanager_secret_version" "eks_service_url_version" {
  secret_id     = aws_secretsmanager_secret.eks_service_url.id
  secret_string = jsonencode({
    service_url = "https://${data.kubernetes_service.fast_food_service.status[0].load_balancer[0].ingress[0].hostname}"
  })

  depends_on = [data.kubernetes_service.fast_food_service]
}

resource "aws_secretsmanager_secret" "aws_credentials" {
  name        = "aws-secret-7"
  description = "AWS credentials for EKS pods"
}

resource "aws_secretsmanager_secret_version" "aws_credentials_version" {
  secret_id     = aws_secretsmanager_secret.aws_credentials.id
  secret_string = jsonencode({
    accessKey  = var.AWS_ACCESS_KEY_ID
    secretKey  = var.AWS_SECRET_ACCESS_KEY
    sessionKey = var.AWS_SESSION_TOKEN
  })
}