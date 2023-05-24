data "aws_eks_cluster" "target" {
  name = var.eks_cluster_name
}

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = var.aws_region_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.target.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.target.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.target.name]
  }
}