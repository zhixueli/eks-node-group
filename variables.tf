variable "eks_cluster_name" {
  type        = string
  default     = "Cluster-BD"
}

variable "nodegroup_role_arn" {
  type        = string
  default     = "arn:aws:iam::066198483852:role/AmazonEKSNodeRole-BD"
}

variable "nodegroup_ami_id" {
  type        = string
  default     = "ami-0e3d54adf66a363de"
}

variable "nodegroup_security_group_ids" {
  type = list
  default = ["sg-060653811a5a07686","sg-0ea39412a9d3d94a9"]
}

variable "ssh_key_name" {
  type = string
  default = "ue2-kp"
}

variable "nodegroup_subnet_ids" {
  type = list
  default = ["subnet-0edcf02e08ef45e28","subnet-085619f487866a2b3"]
}

variable "aws_region_name" {
  type = string
  default = "us-east-2"
}

variable "nodegroup_name" {
  type        = string
  default     = "NG02"
}


