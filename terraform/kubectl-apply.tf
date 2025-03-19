# resource "null_resource" "k8s_apply" {
#   provisioner "local-exec" {
#     command = <<EOT
#       aws eks update-kubeconfig --name fast-food-k8s-5 --region us-east-1
#       cd ../ && kubectl apply -f k8s/
#       sleep 60
#     EOT
#   }
#
#   depends_on = [aws_eks_cluster.fiap]
# }