locals {
  eks-node-private-userdata = <<USERDATA
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: text/x-shellscript; charset="us-ascii"
#!/bin/bash
set -ex
K8S_CLUSTER_DNS_IP=172.20.0.10
sudo /etc/eks/bootstrap.sh '${data.aws_eks_cluster.target.name}' --apiserver-endpoint '${data.aws_eks_cluster.target.endpoint}' --b64-cluster-ca '${data.aws_eks_cluster.target.certificate_authority[0].data}' --kubelet-extra-args '--node-labels=eks.amazonaws.com/nodegroup-image=${var.nodegroup_ami_id},eks.amazonaws.com/capacityType=ON_DEMAND' --dns-cluster-ip $K8S_CLUSTER_DNS_IP --use-max-pods false
echo "Running custom user data script" > /tmp/log.txt
yum update -y
yum upgrade -y
date >> /tmp/log.txt

--//--
USERDATA
}