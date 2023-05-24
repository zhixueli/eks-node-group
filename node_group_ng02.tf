
resource "aws_eks_node_group" "ng02" {
  #ami_type       = "AL2_x86_64"
  depends_on     = [aws_launch_template.lt-ng02]
  cluster_name   = var.eks_cluster_name
  disk_size      = 0
  instance_types = []
  labels = {
    "eks/cluster-name"   = var.eks_cluster_name
    "eks/nodegroup-name" = format("%s-%s",var.nodegroup_name, var.eks_cluster_name)
  }
  node_group_name = format("%s-%s",var.nodegroup_name ,var.eks_cluster_name)
  node_role_arn   = var.nodegroup_role_arn
  subnet_ids = var.nodegroup_subnet_ids

  tags = {
    "eks/cluster-name"                = var.eks_cluster_name
    "eks/nodegroup-name"              = format("%s-%s",var.nodegroup_name ,var.eks_cluster_name)
    "eks/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = var.eks_cluster_name
  }
  #version = "1.17"

  launch_template {
    name    = aws_launch_template.lt-ng02.name
    version = "1"
  }

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  timeouts {}
}
