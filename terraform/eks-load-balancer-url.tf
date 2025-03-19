data "kubernetes_service" "fast_food_service" {
  metadata {
    name      = "fast-food-service"
    namespace = "default"
  }
  depends_on = [aws_eks_cluster.fiap]
}

output "load_balancer_url" {
  value = data.kubernetes_service.fast_food_service.status[0].load_balancer[0].ingress[0].hostname
}