resource "aws_secretsmanager_secret" "eks_service_url" {
  name        = "eks-service-url-4"
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

resource "kubernetes_secret" "aws_credentials" {
  metadata {
    name      = "aws-secret"
    namespace = "default" # ou outro namespace onde a aplicação roda
  }

  data = {
    accessKey  = var.AWS_ACCESS_KEY_ID
    secretKey  = var.AWS_SECRET_ACCESS_KEY
    sessionKey = var.AWS_SESSION_TOKEN
  }

  type = "Opaque"
}