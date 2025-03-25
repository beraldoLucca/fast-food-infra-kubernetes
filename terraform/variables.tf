variable "labRole" {
  default = "arn:aws:iam::528465521739:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::528465521739:role/voclabs"
}

variable "nodeName" {
  default = "fast-food-ng"
}

variable "subnetA" {
  default = "subnet-085288d905e582249"
}

variable "subnetB" {
  default = "subnet-02eb16f645385bf0e"
}

variable "subnetC" {
  default = "subnet-0a628c5da03ff2107"
}

variable "sgId" {
  default = "sg-0318ebd31e822438c"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "AWS_SESSION_TOKEN" {
  type = string
}