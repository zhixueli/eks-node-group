resource "aws_launch_template" "lt-ng02" {
  instance_type           = "t3.medium"
  key_name                = var.ssh_key_name
  name                    = format("at-lt-%s-%s", var.eks_cluster_name, var.nodegroup_name)
  tags                    = {}
  image_id                = var.nodegroup_ami_id
  user_data            = base64encode(local.eks-node-private-userdata)
  vpc_security_group_ids  = var.nodegroup_security_group_ids 
  tag_specifications { 
    resource_type = "instance"
    tags = {
      Name = format("%s-%s", var.eks_cluster_name, var.nodegroup_name)
    }
  }
  lifecycle {
    create_before_destroy=true
  }
}


  #block_device_mappings {
  #  device_name = "/dev/sda1"

  #  ebs {
  #    volume_size = 20
  #  }
  #}
 
  
## Enable this when you use cluster autoscaler within cluster.
## https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md

#  tag {
#    key                 = "k8s.io/cluster-autoscaler/enabled"
#    value               = ""
#    propagate_at_launch = true
#  }
#
#  tag {
#    key                 = "k8s.io/cluster-autoscaler/${var.cluster-name}"
#    value               = ""
#    propagate_at_launch = true
#  }



