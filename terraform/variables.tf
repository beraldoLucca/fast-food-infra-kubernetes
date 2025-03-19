variable "labRole" {
  default = "arn:aws:iam::385515961485:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::385515961485:role/voclabs"
}

variable "nodeName" {
  default = "fast-food-ng-4"
}

variable "subnetA" {
  default = "subnet-0aecd3951ac893b18"
}

variable "subnetB" {
  default = "subnet-0d659753009c6728e"
}

variable "subnetC" {
  default = "subnet-01751db28720e4b6a"
}

variable "sgId" {
  default = "sg-0ffae49eff406a775"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}